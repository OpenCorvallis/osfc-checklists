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

// 73146.typ is more extensively commented, check there first for design notes.

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
]

// -----------------------------------------------------------------------------
// Emergency Checklists (left side)
// -----------------------------------------------------------------------------
#let left_emergency_checklists = [
	#checklist(
		"Engine Malfunction During Takeoff (with sufficient runway ahead)",
		black, emergency: true,
		([Thrust lever], [IDLE]),
		([Brakes], [APPLY]),
		([Flaps (if extended)], [RETRACT]),
		([Engine master], [OFF]),
		([Alternator, battery master], [OFF]),
		([Fuel shutoff valve], [CLOSED]),
	)
	#checklist("Engine Malfunction Immediately After Takeoff", black,
		emergency: true,
		([Airspeed], [Flaps retracted: 65 KIAS\ Flaps extended: 60 KIAS]),
		([Fuel shutoff valve], [CLOSED]),
		([Engine master], [OFF]),
		([Flaps], [AS REQUIRED (30° recommended)]),
		([Alternator, battery master], [OFF]),
	)
	#checklist("Engine Malfunction During Flight", black, emergency: true,
		([Fuel shutoff valve], [OPEN (push full in)]),
		([Fuel selector], [BOTH]),
		([Electric fuel pump], [ON]),
		([Land ASAP.], []),
	)
	#checklist("Restart After Engine Failure", black, emergency: true,
		([Note: If the propeller stops at an airspeed ≥ 65 KIAS, the reason for
			stoppage should be discovered before attempting a restart.], []),
		([Airspeed], [65-85 KIAS (max 100 KIAS)]),
		([Altitude], [BELOW 13,000 FT]),
		([Fuel shutoff valve], [OPEN (push full in)]),
		([Fuel selector], [BOTH]),
		([Electric fuel pump], [ON]),
		([Thrust lever], [IDLE]),
		([Engine master], [OFF THEN ON], [If propeller does not turn, then starter ON]),
		([Thrust lever], [FULL], [Check engine parameters, power]),
	)
	#checklist("FADEC Malfunction in Flight: One FADEC Light is Flashing",
		black, emergency: true,
		([FADEC test knob], [PRESS ≥ 2 seconds]),
		([If FADEC light extinguished (LOW warning):], []),
		([#h(1em)Continue normal flight], []),
		([If FADEC light illuminated steady (HIGH warning):], []),
		([#h(1em)Monitor the other FADEC light], []),
		([#h(1em)Land ASAP], []),
		([#h(1em)Select airspeed to avoid engine overspeed], []),
	)
	#checklist("FADEC Malfunction in Flight: Both FADEC Lights are Flashing",
		black, emergency: true,
		([CED load display], [CONSIDER UNRELIABLE]),
		([FADEC test knob], [PRESS ≥ 2 seconds]),
		([If FADEC lights extinguished (LOW warning):], []),
		([#h(1em)Continue normal flight], []),
		([If FADEC lights illuminated steady (HIGH warning):], []),
		([#h(1em)Check the available engine power], []),
		([#h(1em)Expect engine failure], []),
		([#h(1em)Select airspeed to avoid engine overspeed], []),
		([#h(1em)Land ASAP], []),
		([In case a fuel tank was flown empty:], []),
		([#h(1em)Fuel selector], [BOTH]),
		([#h(1em)Electric fuel pump], [ON]),
		([#h(1em)Check the available engine power, thrust lever response], []),
		([#h(1em)Land ASAP], []),
	)
	#checklist("Abnormal Engine Behavior", black, emergency: true,
		([If the engine acts abnormal during flight and the system does not
			automatically switch to the B-FADEC, it is possible to switch to the
			B-FADEC manually.], []),
		([Select an appropriate airspeed to avoid engine overspeed], []),
		([Force-B switch], [ON]),
		([Be prepared for an emergency landing], []),
		([Land ASAP], []),
	)
]

// -----------------------------------------------------------------------------
// Emergency Checklists (right side)
// -----------------------------------------------------------------------------
#let right_emergency_checklists = [
	#checklist("Engine Fire When Starting Engine on Ground", black,
		emergency: true,
		([Engine master], [OFF]),
		([Fuel shutoff valve], [CLOSED]),
		([Electric fuel pump], [OFF]),
		([Battery master], [OFF]),
		([Fire extinguisher], [USE]),
	)
	#checklist("Engine Fire During Takeoff (on Ground)", black, emergency: true,
		([Engine master], [OFF]),
		([Fuel shutoff valve], [CLOSED]),
		([Electric fuel pump], [OFF]),
		([Battery master], [OFF]),
		([Fire extinguisher], [USE]),
	)
	#checklist("Engine Fire in Flight", black, emergency: true,
		([Engine master], [OFF]),
		([Fuel shutoff valve], [CLOSED]),
		([Electric fuel pump], [OFF]),
		([Battery master], [OFF]),
		([Cabin heat and air], [OFF]),
		([Airspeed], [65 KIAS]),
		([Emergency Landing With Engine Out procedure], [RUN]),
	)
	#checklist("Electrical Fire In Flight", black, emergency: true,
		([Avionics master], [OFF]),
		([Cabin heat and air, vents], [OFF]),
		([Fire extinguisher], [USE]),
		([All electrical switches except alternator, battery master, and engine
			master], [OFF]),
		([If fire continues:], []),
		([Battery master, alternator], [OFF]),
		([Cabin heat and air, vents], [ON]),
		([Check circuit breakers, do not reset open breakers], []),
		([If fire extinguished:], []),
		([#h(1em)Avionics master], [ON]),
		([#h(1em)Turn on electrical equipment required to continue flight and
			land ASAP. Switch breakers ON one at a time, with delay after
			each.], []),
	)
	#checklist("Engine Shut Down In Flight", black, emergency: true,
		([Airspeed], [SELECT TO AVOID ENGINE OVERSPEED (65 KIAS RECOMMENDED)]),
		([Engine master], [OFF]),
		([Fuel shutoff valve], [CLOSED]),
		([Electric fuel pump], [OFF]),
		([To stop propeller (if needed):], []),
		([#h(1em)Airspeed], [< 55 KIAS]),
		([#h(1em)When propeller stopped], [65 KIAS]),
	)
	#checklist("Emergency Landing With Engine Out", black, emergency: true,
		([Airspeed], [Flaps up: 65 KIAS\ Flaps down: 60 KIAS]),
		([Fuel shutoff valve], [CLOSED]),
		([Engine master], [OFF]),
		([Flaps], [AS REQUIRED (RECOMMEND FULL)]),
		([Alternator, battery master], [OFF]),
		([Doors], [UNLOCK]),
		([Touchdown], [SLIGHTLY NOSE UP]),
		([Brake], [FIRMLY]),
	)
]

// -----------------------------------------------------------------------------
// Page definitions and formatting
// -----------------------------------------------------------------------------

#set text(fallback: false, font: "DejaVu Sans")

#let heading_size = 10pt
#let margins = 5mm
#page(flipped: true, margin: margins, paper: "us-letter")[
	#columns(2, gutter: 2*margins)[
		#set text(heading_size)
		= Ground Checklists and Information #h(1fr) N72PE
		#columns(2)[
			#set text(9pt)
			#ground_checklists_and_info
		]
		#v(1fr)
		= Version 1 #h(1fr) #include "signature.typ"
		#colbreak()
		= Operating Checklists #h(1fr) N72PE
		#columns(2)[
			#set text(9pt)
			#operating_checklists
		]
	]
]
#page(flipped: true, margin: margins, paper: "us-letter")[
	#columns(2, gutter: 2*margins)[
		#set text(heading_size)
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
