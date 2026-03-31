#!/bin/bash
# ============================================================
# Script 5: Interactive Open Source Quiz
# Course: Open Source Software (Auditing Python)
# Description: Asks the user 3 questions about open source
#              software and saves their answers to a .txt file.
# ============================================================

echo "============================================"
echo "     OPEN SOURCE SOFTWARE QUIZ             "
echo "============================================"
echo ""
echo "  Welcome! Please answer the 3 questions below."
echo "  Your responses will be saved automatically."
echo ""

# Generate a timestamped output filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT_FILE="oss_quiz_answers_${TIMESTAMP}.txt"

# Write file header
{
    echo "================================================"
    echo "    OPEN SOURCE SOFTWARE QUIZ — ANSWERS        "
    echo "================================================"
    echo "  Submitted By : $(whoami)"
    echo "  Date & Time  : $(date '+%A, %d %B %Y at %H:%M:%S')"
    echo "================================================"
    echo ""
} > "$OUTPUT_FILE"

# -------------------------------------------------------
# Question 1
# -------------------------------------------------------
echo "--------------------------------------------"
echo "  QUESTION 1 of 3:"
echo ""
echo "  What do you understand by the term"
echo "  'Open Source Software'? Give an example."
echo ""
read -r -p "  Your Answer: " answer1
echo ""

{
    echo "QUESTION 1:"
    echo "What do you understand by the term 'Open Source Software'?"
    echo "Give an example."
    echo ""
    echo "Answer:"
    echo "  $answer1"
    echo ""
    echo "------------------------------------------------"
    echo ""
} >> "$OUTPUT_FILE"

# -------------------------------------------------------
# Question 2
# -------------------------------------------------------
echo "--------------------------------------------"
echo "  QUESTION 2 of 3:"
echo ""
echo "  Name TWO popular Open Source licenses and"
echo "  briefly describe what each one permits."
echo ""
read -r -p "  Your Answer: " answer2
echo ""

{
    echo "QUESTION 2:"
    echo "Name TWO popular Open Source licenses and briefly describe what each permits."
    echo ""
    echo "Answer:"
    echo "  $answer2"
    echo ""
    echo "------------------------------------------------"
    echo ""
} >> "$OUTPUT_FILE"

# -------------------------------------------------------
# Question 3
# -------------------------------------------------------
echo "--------------------------------------------"
echo "  QUESTION 3 of 3:"
echo ""
echo "  How does the Python programming language"
echo "  demonstrate the principles of Open Source"
echo "  Software development?"
echo ""
read -r -p "  Your Answer: " answer3
echo ""

{
    echo "QUESTION 3:"
    echo "How does Python demonstrate the principles of Open Source Software development?"
    echo ""
    echo "Answer:"
    echo "  $answer3"
    echo ""
    echo "------------------------------------------------"
    echo ""
    echo "================================================"
    echo "              END OF SUBMISSION                "
    echo "================================================"
} >> "$OUTPUT_FILE"

# -------------------------------------------------------
# Confirmation & Review
# -------------------------------------------------------
echo "--------------------------------------------"
echo ""
echo "  ✔  All answers saved successfully!"
echo ""
echo "  File Name : $OUTPUT_FILE"
echo "  Location  : $(pwd)/$OUTPUT_FILE"
echo ""
echo "============================================"
echo "         REVIEW: YOUR SAVED ANSWERS        "
echo "============================================"
echo ""
cat "$OUTPUT_FILE"
echo ""
echo "============================================"
echo "      QUIZ COMPLETE — GOOD LUCK! 🎓        "
echo "============================================"
