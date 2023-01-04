import os
import pickle
import warnings
import numpy as np
from FeaturesExtractor import FeaturesExtractor

warnings.filterwarnings("ignore")


class DialectIdentifier:

    def __init__(self, bhojpuri_files_path, mathili_files_path, rajsthani_files_path, bhojpuri_model_path, mathili_model_path, rajsthani_model_path):
        self.bhojpuri_training_path = bhojpuri_files_path
        self.mathili_training_path   = mathili_files_path
        self.rajsthani_training_path   = rajsthani_files_path
        self.error                 = 0
        self.total_sample          = 0
        self.features_extractor    = FeaturesExtractor()
        # load models
        self.bhojpuri_gmm = pickle.load(open(bhojpuri_model_path, 'rb'))
        self.mathili_gmm   = pickle.load(open(mathili_model_path, 'rb'))
        self.rajsthani_gmm   = pickle.load(open(rajsthani_model_path, 'rb'))

    def process(self):
        files = self.get_file_paths(self.bhojpuri_training_path, self.mathili_training_path, self.rajsthani_training_path)
        
        # read the test directory and get the list of test audio files
        for file in files:
            self.total_sample += 1
            print("%10s %8s %1s" % ("--> TESTING", ":", os.path.basename(file)))

            vector = self.features_extractor.extract_features(file)
            winner = self.identify_dialect(vector)
            expected_dialect = file.split("\\")[0][5:]

            print("%10s %6s %1s" % ("+ EXPECTATION",":", expected_dialect))
            print("%10s %3s %1s" %  ("+ IDENTIFICATION", ":", winner))

            if winner != expected_dialect: self.error += 1
            print("----------------------------------------------------")

        accuracy     = ( float(self.total_sample - self.error) / float(self.total_sample) ) * 100
        accuracy_msg = "*** Accuracy = " + str(round(accuracy, 3)) + "% ***"
        print(accuracy_msg)

    def get_file_paths(self, bhojpuri_training_path, mathili_training_path,rajsthani_training_path):
        # get file paths
        bhojpuri = [ os.path.join(bhojpuri_training_path, f) for f in os.listdir(bhojpuri_training_path) ]
        mathili   = [ os.path.join(mathili_training_path, f) for f in os.listdir(mathili_training_path) ]
        rajsthani   = [ os.path.join(rajsthani_training_path, f) for f in os.listdir(rajsthani_training_path) ]
        files   = bhojpuri + mathili + rajsthani
        return files

    def identify_dialect(self, vector):
        # bhojpuri hypothesis scoring
        is_bhojpuri_scores         = np.array(self.bhojpuri_gmm.score(vector))
        is_bhojpuri_log_likelihood = is_bhojpuri_scores.sum()
        
        # mathili hypothesis scoring
        is_mathili_scores         = np.array(self.mathili_gmm.score(vector))
        is_mathili_log_likelihood = is_mathili_scores.sum()
        
        # mathili hypothesis scoring
        is_rajsthani_scores         = np.array(self.rajsthani_gmm.score(vector))
        is_rajsthani_log_likelihood = is_rajsthani_scores.sum()

        print("%10s %5s %1s" % ("+ Bhojpuri Score",":", str(round(is_bhojpuri_log_likelihood, 3))))
        print("%10s %7s %1s" % ("+ Mathili Score", ":", str(round(is_mathili_log_likelihood,3))))
        print("%10s %7s %1s" % ("+ Rajsthani Score", ":", str(round(is_rajsthani_log_likelihood,3))))

        if is_mathili_log_likelihood > is_bhojpuri_log_likelihood and is_mathili_log_likelihood > is_rajsthani_log_likelihood:
            winner = "mathili"
        elif is_rajsthani_log_likelihood > is_bhojpuri_log_likelihood and is_rajsthani_log_likelihood > is_mathili_log_likelihood: 
            winner = "rajsthani"
        else:
            winner = "bhojpuri"
        return winner


if __name__== "__main__":
    dialect_identifier = DialectIdentifier("test/bhojpuri", "test/mathili", "test/rajsthani" ,"bhojpuri.gmm", "mathili.gmm", "rajsthani.gmm" )
    dialect_identifier.process()
