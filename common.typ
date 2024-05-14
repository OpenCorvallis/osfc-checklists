// Copyright 2024 Oregon State Flying Club
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//------------------------------------------------------------------------------
// Tuning parameters
//------------------------------------------------------------------------------

// Note: All sizes are specified relative to the text size (in em). This makes
// the text size function as a global "resize everything" setting, which makes
// it easier to use text size to fit the contents to the page size.

// Thickness of the outline around the checklist steps. This isn't actually the
// rectangle's stroke; it is rendered by insetting another (white) rectangle on
// top of the background rectangle. As a result, this width is the inset value
// for the outer rectangle.
#let edge_width = .1em

// The inner radius of the rounded corners -- this becomes the edge radius for
// the outside of the inner rectangles.
#let inner_radius = .4em

// The distance the title is inset relative to the interior of the outline. The
// checklist items are horizontally inset by this value as well, so they align
// with the left of the title text.
#let title_inset = .4em

// Line spacing for the contents of the checklist. We set this explicitly so we
// can match the spacing between steps (which is controlled by box insets) with
// the spacing between text within the steps (which is controlled by par).
#let line_spacing = .5em

//------------------------------------------------------------------------------
// Checklist step functions
//------------------------------------------------------------------------------

// Each step in the checklist is a closure (function) with the following
// signature:
//     (vars) => (vars, content)
//
// `vars` is a dictionary that contains most of the state of the checklist
// function. The closure can use `vars` to change what it produces (e.g.
// formatting differently when they are on the last row, where corners may be
// rounded), and can also change `vars` (to e.g. alter the background color
// alternation).
//
// If `content` is an array, then each of the elements of the array will be
// appended to the checklist stack. If it is anything else, it will be a single
// entry on the checklist stack.
//
// Oh, and because calling a function for every checklist entry would be too
// verbose, checklist() recognizes a two-element array as a basic_row() and a
// three-element array as a with_note() and calls those functions for you.

// Draws the background box for each checklist row, with the provided contents
// inside.
#let bg_box(vars, contents) = (vars, box(
	fill: vars.bg_colors.at(vars.bg_idx),
	inset: (x: title_inset, y: line_spacing/2),
	radius: if vars.last { (bottom: vars.inner_radius) } else { 0em },
	contents,
))

// Provides the basic 2-element checklist grid.
#let basic_grid(left, right) = grid(
	column-gutter: 1fr, columns: 2,
	par(leading: line_spacing, left),
	par(leading: line_spacing, align(alignment.right, right)),
)

// A basic 2-element checklist entry.
#let basic_row(left, right) = vars => bg_box(vars, basic_grid(left, right))

// A checklist entry with a note attached.
#let with_note(left, right, note) = vars => bg_box(vars, stack(
	basic_grid(left, right),
	[#h(1fr) #box(inset: (top: line_spacing), par(leading: line_spacing, note))]
))

// A group heading within a checklist.
#let checklist_group(name) = vars => {
	vars.bg_idx = 0
	let (vars, out) = bg_box(vars, [#h(1fr) #name #h(1fr)])
	if not vars.first {
		out = (
			// The outset makes the drawn rectangle overlap the outer border,
			// preventing a thin white line along the edge.
			rect(width: 100%, height: edge_width, fill: vars.color, outset: (x: edge_width/2)),
			out,
		)
	}
	(vars, out)
}

//------------------------------------------------------------------------------
// checklist()
//------------------------------------------------------------------------------

#let checklist(title, color, emergency: false, ..arguments) = {
	let steps = arguments.pos();
	let vars = (
		bg_colors: (white, silver),
		// Index of the current background color within `bg_colors`.
		bg_idx: 0,
		// The color of the checklist box.
		color: color,
		// True if this is the first checklist step, false otherwise.
		first: true,
		// Inner radius of the rounded corners.
		inner_radius: inner_radius,
		// True if this is the last checklist step, false otherwise.
		last: false,
		// Radius of the outside of the box's rounded corners.
		outer_radius: inner_radius + edge_width,
	)
	// To make the emergency checklists stand out visually, give them sharp
	// corners.
	if emergency {
		vars.inner_radius = 0em
		vars.outer_radius = 0em
	}
	let rows = for (i, step) in steps.enumerate() {
		if i == steps.len() - 1 { vars.last = true }
		// Call basic_row() or with_note() for the caller if this step is an
		// array.
		if type(step) == array {
			step = if step.len() == 2 {
				basic_row(..step)
			} else {
				with_note(..step)
			}
		}
		let (new_vars, row) = step(vars)
		vars = new_vars
		vars.bg_idx += 1
		if vars.bg_idx >= vars.bg_colors.len() { vars.bg_idx = 0 }
		vars.first = false
		if type(row) != array {
			row = (row,)
		}
		row
	}
	// The outer rectangle provides the outline around the checklist as well as
	// the background fill for the title portion. The inner rectangle provides a
	// solid white background, preventing the outer rectangle from showing
	// through the cracks between the per-step boxes.
	rect(fill: color, inset: edge_width, radius: vars.outer_radius, stack(
		box(inset: title_inset, text(fill: white, weight: "bold", title)),
		rect(fill: white, inset: 0em, radius: (bottom: vars.inner_radius), stack(..rows))
	))
}
