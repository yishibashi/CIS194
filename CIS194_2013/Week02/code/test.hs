import           Log
import           LogAnalysis

import           System.IO
import           Test.Hspec

main = hspec $ do
     describe "parseMessage" $ do
        it "parseMessage : Error" $
          parseMessage "E 2 562 help help" `shouldBe` LogMessage (Error 2) 562 "help help"
        it "parseMessage : Info" $
          parseMessage "I 29 la la la" `shouldBe` LogMessage Info 29 "la la la"

        it "parseMessage : Unknown" $
            parseMessage "This is not in the right format" `shouldBe` Unknown "This is not in the right format"



