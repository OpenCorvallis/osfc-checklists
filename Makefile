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

# This Makefile produces two sets of output files:
#
#   1. The "normal" PDF files.
#   2. SVG images of each page.
#
# The normal PDF files are produced by `typst compile <file>`. Use these for
# manual review and printing. This Makefile keeps them in the position that
# Typst puts them by default (next to the .typ files) so that you can easily
# mix `make` invocations with manual `typst compile` commands.
#
# The SVG images are placed in the svgs/ directory. There are used by the Post
# Comment workflow to embed images into PR comments.

# This should be the only thing that needs to change if a checklist is added or
# removed.
planes ::= 73146

# Paths to the normal PDF files.
normal_pdfs ::= $(foreach plane,$(planes),$(plane).pdf)

# The number of SVGs generated varies from checklist to checklist. Rather than
# telling make exactly which SVGs are generated for each airplane (which would
# have to be hardcoded and updated manually), we just have one phony target to
# generate the SVGs for each plane. svg_targets is the list of the SVG target
# names.
svg_targets ::= $(foreach plane,$(planes),svgs/$(plane))

# Meta targets that build collections of other targets
.PHONY: all normal svgs
all: normal svgs
normal: $(normal_pdfs)
svgs: $(svg_targets)

.PHONY: clean
clean:
	rm -df $(foreach plane,$(planes),$(plane).pdf svgs/$(plane)_*.svg) svgs/

$(normal_pdfs): %.pdf: %.typ common.typ signature.typ
	typst compile $<

svgs_dir:
	mkdir -p svgs

.PHONY: $(svg_targets)
$(svg_targets): svgs/%: %.typ common.typ signature.typ | svgs_dir
	rm -f svgs/$*_*.svg
	typst compile $< svgs/$*_{p}.svg
