CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
file_found=$(find student-submission/ -type f -name "ListExamples.java")

# Check if the file was found
if [ -z "$file_found" ]; 
then
  echo "ListExamples.java not found. Exiting script."
  echo "You received 0 point. You failed"
  exit 1
else
  echo "ListExamples.java found: $file_found"
  # Continue with the rest of your script
fi


cp $file_found ./TestListExamples.java grading-area/ 

echo "finish copy"

cp -r ./lib grading-area/ 
cd grading-area

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
if [ $? -eq 1 ];
then
    echo "Compile error. Exiting script."
    echo "You received 0 point. You failed"
    exit 1
else
    echo "finish complie"
fi
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples

echo "You are genius"
