#!/bin/bash
# The purpose of this script is to check parity between official hosted  third party js libraries, and alternative CDNs used on this site.

function compare {
            printf "=================\ncomparing:\n%s vs. %s\n" "$1" "$2"
            wget "$1" -O f1 &> /dev/null
            wget "$2" -O f2 &> /dev/null
            if ! cmp f1 f2;
                then
                    printf "Files are NOT the same!\n"
                    exit 1;
                else
                    printf "Files are the same.\n"
            fi
            }

compare "https://unpkg.com/@primer/css/dist/primer.css" "https://cdn.bootcdn.net/ajax/libs/Primer/19.7.0/primer.min.css"
#compare "https://hypothes.is/embed.js" "https://cdn.jsdelivr.net/npm/hypothesis/build/boot.js"
compare "https://cdn.jsdelivr.net/npm/katex@0.15.3/dist/contrib/auto-render.min.js" "https://cdn.bootcdn.net/ajax/libs/KaTeX/0.15.3/contrib/auto-render.min.js"
compare "https://cdn.jsdelivr.net/npm/katex@0.15.3/dist/katex.min.css" "https://cdn.bootcdn.net/ajax/libs/KaTeX/0.15.3/katex.min.css"
compare "https://cdn.jsdelivr.net/npm/katex@0.15.3/dist/katex.min.js" "https://cdn.bootcdn.net/ajax/libs/KaTeX/0.15.3/katex.min.js"
compare "https://cdn.jsdelivr.net/npm/mathjax@2.7.9/MathJax.js" "https://cdn.bootcdn.net/ajax/libs/mathjax/2.7.9/MathJax.min.js"
compare "https://cdn.jsdelivr.net/npm/mathjax@2.7.9/extensions/MathMenu.js" "https://cdn.bootcdn.net/ajax/libs/mathjax/2.7.9/extensions/MathMenu.min.js"
compare "https://cdn.jsdelivr.net/npm/mathjax@2.7.9/extensions/MathZoom.js" "https://cdn.bootcdn.net/ajax/libs/mathjax/2.7.9/extensions/MathZoom.min.js"

# Remove files created for comparison
rm f1 f2
