#!/bin/bash
# not smart about file format. Focus on Mac screenshots in PNG format
convert "$1" -channel RGB -negate inverted.png
