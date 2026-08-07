#!/usr/bin/env python3
"""Convert stdin to sentence case. Used by the !!sent espanso match.

CACHE PERSISTENTE NOS ASSETS - CLOUDFLARE -> Cache persistente nos assets cloudflare
"""
import re
import sys

text = sys.stdin.read().strip().lower()

# Drop " - " style separators, but keep hyphens inside words like "e-mail".
text = re.sub(r"\s+[-–—]+\s+", " ", text)
text = re.sub(r"^[-–—]+\s+", "", text)

# Collapse runs of spaces and tabs, preserving line breaks.
text = re.sub(r"[^\S\n]+", " ", text)

# Capitalize the first letter of each sentence.
out = []
start_of_sentence = True
for char in text:
    if start_of_sentence and char.isalpha():
        out.append(char.upper())
        start_of_sentence = False
    else:
        out.append(char)
        if char in ".!?\n":
            start_of_sentence = True

sys.stdout.write("".join(out))
