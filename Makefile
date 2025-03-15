# Copyright 2025 Oregon State Flying Club
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This Makefile produces three sets of output files:
#
#   1. The "normal" PDF files.
#   2. The "print shop" PDF files.
#   3. SVG images of each page.
#
# The normal PDF files are produced by `typst compile <file>`. Use these for
# manual review and printing at home. This Makefile keeps them in the position
# that Typst puts them by default (next to the .typ files) so that you can
# easily mix `make` invocations with manual `typst compile` commands.
#
# The print shop PDF files are put into a print_shop/ directory. These files
# have every even page rotated 180 degrees. This minimizes misalignment during
# manual double-sided printing (see fabricating.md for more information).
#
# The SVG images are placed in the svgs/ directory. There are used by the Post
# Comment workflow to embed images into PR comments.

# This should be the only thing that needs to change if a checklist is added or
# removed.
planes ::= 66083 72pe 73146

# Paths to the normal PDF files.
normal_pdfs ::= $(foreach plane,$(planes),$(plane).pdf)

# Paths to the print shop PDF files.
print_shop_pdfs ::= $(foreach plane,$(planes),print_shop/$(plane).pdf)

# The number of SVGs generated varies from checklist to checklist. Rather than
# telling make exactly which SVGs are generated for each airplane (which would
# have to be hardcoded and updated manually), we just have one phony target to
# generate the SVGs for each plane. svg_targets is the list of the SVG target
# names.
svg_targets ::= $(foreach plane,$(planes),svgs/$(plane))

# Meta targets that build collections of other targets
.PHONY: all normal print_shop svgs
all: normal print_shop svgs
normal: $(normal_pdfs)
print_shop: $(print_shop_pdfs)
svgs: $(svg_targets)

.PHONY: clean
clean:
	rm -df $(print_shop_pdfs) \
		$(foreach plane,$(planes),$(plane).pdf svgs/$(plane)_*.svg) \
		print_shop/ svgs/

$(normal_pdfs): %.pdf: %.typ
	typst compile $<

print_shop_dir:
	mkdir -p print_shop

# qpdf was chosen because it can rotate pages without re-encoding the page (it
# should only touch the page angle metadata), thereby avoiding quality loss.
$(print_shop_pdfs): print_shop/%.pdf: %.pdf | print_shop_dir
	qpdf --rotate=+180:1-z:even $*.pdf $@

svgs_dir:
	mkdir -p svgs

.PHONY: $(svg_targets)
$(svg_targets): svgs/%: %.typ | svgs_dir
	rm -f svgs/$*_*.svg
	typst compile $< svgs/$*_{p}.svg
