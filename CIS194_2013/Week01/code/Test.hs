import           HW01

{-- TEST --}
import           System.IO
import           Test.Hspec
main = hspec $ do
     describe "toDigits" $ do
        it "toDigits 1234 == [1,2,3,4]" $
          toDigits 1234 `shouldBe` [1,2,3,4]
        it "toDigits 0 == []" $
          toDigits 0 `shouldBe` []
        it "toDigits -17 == []" $
          toDigits (-17) `shouldBe` []
     describe "toDigitsRev" $ do
        it "toDigitsRev 1234 == [4,3,2,1]" $
          toDigitsRev 1234 `shouldBe` [4,3,2,1]
     describe "doubleEveryOther" $ do
       it "doubleEveryOther [8,7,6,5] == [16,7,12,5]" $
          doubleEveryOther [8,7,6,5] `shouldBe` [16,7,12,5]
       it "doubleEveryOther [1,2,3] == [1,4,3]" $
          doubleEveryOther [1,2,3] `shouldBe` [1,4,3]
     describe "sumDigits" $ do
       it "sumDigits [16, 7, 12, 5] == 22" $
          sumDigits [16,7,12,5] `shouldBe` 22
     describe "validate creditcard number" $ do
       it "validate 4012888888881881 == True" $
          validate 4012888888881881 `shouldBe` True
       it "validate 4012888888881882 == False" $
          validate 4012888888881882 `shouldBe` False
     describe "hanoi's tower" $ do
       it "hanoi 2 a b c ~?= [(a,c), (a,b), (c,b)]" $
          hanoi 2 "a" "b" "c" `shouldBe` [("a","c"), ("a","b"), ("c","b")]
{-- / TEST --}
