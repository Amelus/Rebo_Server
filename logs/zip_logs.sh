#!/bin/bash
echo "Compressing nodejs and rebo_jar into $(date +%Y-%m-%d)-logs.zip"
zip $(date +%Y-%m-%d)-logs.zip nodejs/* rebo_jar/*
echo "Compress finished, removing files from directories"
rm nodejs/*
rm rebo_jar/*
echo "Process finished"
