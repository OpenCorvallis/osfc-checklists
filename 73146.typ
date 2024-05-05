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

// General design note: The checklists are defined in variables, then the pages
// are created and formatted at the bottom of the file. This puts all the
// formatting details in one place in the file, making it easier to perform
// formatting revisions.

#import "common.typ": checklist, checklist_group

// -----------------------------------------------------------------------------
// Ground Checklists and Information page
// -----------------------------------------------------------------------------
#let ground_checklists_and_info = [
]

// -----------------------------------------------------------------------------
// Operating Checklists
// -----------------------------------------------------------------------------
#let operating_checklists = [
	#checklist("Start", black,
		checklist_group("Before Start"),
		([Preflight inspection], [COMPLETE]),
		([Passenger briefing], [COMPLETE]),
		([Brakes], [TEST and SET]),
		([Seats, belts, harnesses], [SECURE]),
		([Fuel valve], [BOTH]),
		([Radios, electrical equipment], [OFF]),
		([Circuit breakers], [CHECK IN]),
		([Beacon switch], [ON]),
		checklist_group("Engine Start"),
		([Mixture], [RICH]),
		([Carburetor heat], [COLD]),
		([Prime], [AS REQUIRED]),
		([Throttle], [OPEN 1/8 INCH]),
		([Master], [ON]),
		([Propeller area], [CLEAR]),
		([Ignition switch], [START], [Release when engine starts]),
		([Oil pressure], [CHECK], [If no pressure in 30 seconds, shutdown]),
		([Mixture], [GROUND LEAN]),
		checklist_group("Before Taxi"),
		([Headset], [ON]),
		([Flaps], [RETRACT]),
		([Weather], [OBTAIN]),
		([Altimeter], [SET]),
		([EFB Setup], [AS DESIRED]),
		([Navigation, landing lights], [ON]),
	)
]

// -----------------------------------------------------------------------------
// Emergency Checklists (left side)
// -----------------------------------------------------------------------------
#let left_emergency_checklists = [
]

// -----------------------------------------------------------------------------
// Emergency Checklists (right side)
// -----------------------------------------------------------------------------
#let right_emergency_checklists = [
]

// -----------------------------------------------------------------------------
// Page definitions and formatting
// -----------------------------------------------------------------------------

// This is set to the minimum margin size that Ryan V's printer can support
// (experimentally-determined).
#let margins = 6mm
#page(flipped: true, margin: margins, paper: "us-letter")[
	// page() supports multiple columns, but does not support setting the gutter
	// width for multiple columns, so we call columns() ourselves instead.
	#columns(2, gutter: 2*margins)[
		= Ground Checklists and Information #h(1fr) N73146
		#columns(2)[
			#set text(10pt)
			#ground_checklists_and_info
		]
		#v(1fr)
		= Version 1 #h(1fr) #include "signature.typ"
		#colbreak()
		= Operating Checklists #h(1fr) N73146
		#columns(2)[
			#set text(9pt)
			#operating_checklists
		]
	]
]
#page(flipped: true, margin: margins, paper: "us-letter")[
	#columns(2, gutter: 2*margins)[
		#box(fill: red, width: 100%,
		     align(center, box(fill: white, outset: 1em)[= Emergency Checklists]))
		#v(-.5em)
		#columns(2, gutter: 2mm)[
			#set text(9pt)
			#left_emergency_checklists
		]
		#colbreak()
		#box(fill: red, width: 100%,
		     align(center, box(fill: white, outset: 1em)[= Emergency Checklists]))
		#v(-.5em)
		#columns(2, gutter: 2mm)[
			#set text(9pt)
			#right_emergency_checklists
		]
	]
]
