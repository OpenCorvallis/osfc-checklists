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

#import "common.typ": checklist, checklist_group, container, palette, title_inset

// -----------------------------------------------------------------------------
// Operating Checklists
// -----------------------------------------------------------------------------
#let operating_checklists = [
	#checklist("Start", palette.purple,
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
		([Fuel pump], [ON]),
		([Thrust lever], [IDLE]),
		([Propeller area], [CLEAR]),
		([Engine master], [ON], [Wait for Glow lamp to extinguish]),
		([Starter], [ENGAGE UNTIL 500rpm]),
		([Oil pressure], [CHECK], [If no pressure in 3 seconds, shutdown]),
		checklist_group("FADEC Backup Battery Test"),
		([Alternator], [OFF]),
		([Master], [OFF], [Min. 10 seconds]),
		([Master], [ON]),
		([Alternator], [ON]),
		([CED-Test button], [PRESS]),
		checklist_group("Before Taxi"),
		([Avionics], [ON]),
		([Headset], [ON]),
		([Ammeter], [CHECK CHARGING]),
		([Voltmeter], [CHECK]),
		([Fuel pump], [OFF]),
		([Flaps], [RETRACT]),
		([Altimeters], [SET]),
		([Navigation, lights], [ON]),
	)
	#checklist("Run-up", palette.light_green,
		([Instruments], [CHECK and SET]),
		([VOR check], [IF NEEDED]),
		([Brakes], [SET]),
		([Doors and windows], [CLOSED, LOCKED]),
		([Flight controls], [FREE and CORRECT]),
		([Fuel valve], [BOTH]),
		([Thrust lever], [IDLE]),
		([FADEC test button], [PRESS and HOLD]),
			([Both FADEC lights], [CHECK ON], [RPM increases]),
		([FADEC B light], [CHECK ON], [RPM decreases]),
		([FADEC A light], [CHECK ON], [RPM increases, then decreases]),
		([Both FADEC lights], [CHECK OFF, RPM IDLE]),
		([FADEC test button], [RELEASE]),
	),
	#checklist("Run-up (continued)", palette.light_green,
		([Force FADEC B switch], [FORCE FADEC B], [Engine should run normally]),
		([Force FADEC B switch], [OFF]),
		([Thrust lever], [FULL FORWARD], [Min. load 94%, RPM 2240-2300]),
		([Thrust lever], [IDLE]),
		([Vacuum gauge], [CHECK]),
	)
	#checklist("Before Takeoff", palette.dark_green,
		([Radios, navigation, instruments], [SET]),
		([Takeoff briefing], [COMPLETE]),
		([Beacon, navigation, landing lights], [ON]),
		([Flaps], [0-10°]),
		([Trim], [TAKEOFF]),
		([Fuel valve], [BOTH]),
		([Fuel quantity], [CHECK]),
		([Fuel pump], [ON]),
	)
	#checklist("Climb", palette.light_blue,
		([Fuel pump], [OFF]),
		([Airspeed], [70-85 KIAS]),
		([Throttle], [FULL]),
	)
	#checklist("Cruise", palette.dark_blue,
		([Power], [AS REQUIRED], [75% recommended]),
		([Trim], [ADJUST]),
	)
	#checklist("Before Landing", palette.brown,
		([Fuel valve], [BOTH]),
		([Fuel pump], [ON]),
		([Landing light], [ON]),
		([Airspeed], [69-80 KIAS (flaps UP)]),
		([Flaps], [AS REQUIRED]),
		([Airspeed], [60-70 KIAS (flaps DOWN)]),
	)
	#checklist("After Landing", palette.dark_green,
		([Flaps], [UP]),
		([Fuel pump], [OFF]),
	)
	#checklist("Shutdown", palette.black,
		([Brakes], [SET]),
		([Thrust lever], [IDLE]),
		([Avionics, electrical equipment], [OFF]),
		([Engine master], [OFF]),
		([Master], [OFF]),
	)
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
// Ground Checklists and Information page
// -----------------------------------------------------------------------------
#let ground_checklists_and_info_columns = [
	#checklist("Preflight", palette.brown,
		checklist_group("Fluids"),
		([Engine master], [OFF]),
		([Fuel quantity], [CHECK VISUALLY]),
		([Fuel sumps], [DRAIN],
		 [Left wing, right wing, fuel strainer. Inspect for contamination.]),
		([Fuel filler caps], [SECURE]),
		([Engine oil level], [CHECK], [Minimum 6 quarts]),
		([Gearbox oil level], [CHECK], [Oil must cover at least 1/2 of inspection glass]),
		checklist_group("Cabin"),
		([Pitot cover], [REMOVE]),
		([POH], [VERIFY PRESENT]),
		([Master], [ON]),
		([Flaps], [EXTEND]),
		([Fuel gauges], [CHECK QUANTITY]),
		([Water level light], [CHECK OFF]),
		([Avionics], [ON], [Check avionics fan audible]),
		([Avionics], [OFF]),
		([Annunciator panel], [TST]),
		([Lights], [CHECK]),
		([Pitot heat], [TEST]),
		([Master], [OFF]),
		([Fire extinguisher], [SECURE]),
		([Control lock], [REMOVE]),
		checklist_group("Empennage"),
		([Rudder gust lock], [REMOVE]),
		([Control surfaces], [CHECK]),
		checklist_group("Right"),
		([Main wheel tire], [CHECK INFLATION]),
		([Aileron], [CHECK]),
		checklist_group("Nose"),
		([Propeller, spinner], [CHECK]),
		([Air filter], [CHECK CLEAR]),
		([Nosewheel & strut], [CHECK INFLATED]),
		([Static source], [CHECK CLEAR]),
	)
	#checklist("Preflight (continued)", palette.brown,
		checklist_group("Left"),
		([Main wheel tire], [CHECK INFLATION]),
		([Fuel tank vent], [CHECK CLEAR]),
		([Pitot tube], [CHECK CLEAR]),
		([Stall warning], [TEST]),
		([Aileron], [CHECK]),
		checklist_group("Final"),
		([Flight Circle], [DISPATCH]),
		([Hobbs times], [RECORD]),
		([Baggage door], [LOCK]),
		([Chocks], [REMOVE]),
		([Tie-downs], [REMOVE]),
	)
	#checklist("Securing", palette.black,
		([Control lock], [INSTALL]),
		([Tie-downs, chocks], [APPLY]),
		([Vents, windows], [CLOSE]),
		([Pitot cover], [APPLY]),
		([Flight Circle], [CHECK IN]),
		([Doors], [LOCK]),
	)
	#container("Speeds", palette.purple, inset: false, {
		set par(leading: 0.3em)
		table(
			align: (left + horizon, center, center),
			columns: (auto, 1fr, auto),
			fill: (_, row) => (none, palette.grey).at(calc.rem(row, 2)),
			inset: (x: title_inset, y: .3em),
			stroke: none,
			[], [], [KIAS],
			table.hline(stroke: .05em + palette.purple),
			[Best glide (V#sub[G])], [], [65],
			[Best angle\ of climb (V#sub[X])], [Sea level\ 10,000 ft], [60\ 65],
			[Best rate\ of climb (V#sub[Y])], [Sea level\ 10,000 ft], [79\ 71],
			[Landing approach], box(align(left)[Flaps up\ Flaps 40]),
				[69-80\ 60-70],
			[Normal takeoff\ climb], [], [70-80],
			[Short-field\ takeoff climb], [Flaps 10], [57],
			[Normal enroute\ climb], [Sea level\ 10,000 ft], [75-85\ 70-80],
			[Design maneuvering\ speed (V#sub[A])],
				[2450 lbs\ 2000 lbs\ 1600 lbs], [97\ 91\ 82],
		)
	})
]

#let light_gun_signals = container("Light Gun Signals", palette.light_green,
	inset: false, {
		let signal(color, width) = {
			let width_unit = 1em
			let height_unit = .7em
			if color == none {
				h(width * width_unit)
			} else {
				rect(fill: color, height: height_unit,
					stroke: if color == white { .05em } else { none },
					width: width * width_unit)
			}
		}
		let solid(color) = signal(color, 5)
		let blink(a, b) = stack(dir: ltr, signal(a, 1), signal(b, 1),
			signal(a, 1), signal(b, 1), signal(a, 1))
		set par(leading: 0.3em)
		align(center, table(
			align: (right + horizon, center + horizon, left + horizon),
			columns: (1fr, auto, 1fr),
			fill: (_, row) => (none, palette.grey).at(calc.rem(row, 2)),
			inset: .2em,
			stroke: none,
			[*Aircraft on the Ground*], [], [*Aircraft in Flight*],
			table.hline(stroke: .05em + palette.light_green),
			[Cleared for takeoff], solid(palette.lg_green), [Cleared to land],
			[Cleared for taxi], blink(palette.lg_green, none), [Return for
				landing (to be followed by steady green at the proper time)],
			[STOP], solid(palette.lg_red),
				[Give way to other aircraft and continue circling],
			[Taxi clear of the runway in use], blink(palette.lg_red, none),
				[Airport unsafe, do not land],
			[Return to starting point on airport], blink(white, none),
				[Not applicable],
			[Exercise extreme caution], blink(palette.lg_green, palette.lg_red),
				[Exercise extreme caution],
		))
	}
)


// -----------------------------------------------------------------------------
// Page definitions and formatting
// -----------------------------------------------------------------------------

#set text(fallback: false, font: "DejaVu Sans")

#let heading_base_size = 8pt
#let margins = 5mm
#page(flipped: true, margin: margins, paper: "us-letter")[
	#columns(2, gutter: 2*margins)[
		#set text(heading_base_size)
		= Ground Checklists and Information #h(1fr) N72PE
		#set text(8.6pt)
		#columns(2)[
			#ground_checklists_and_info_columns
		]
		#light_gun_signals
		#v(1fr)
		= Version 1 #h(1fr) #include "signature.typ"
		#colbreak()
		= Operating Checklists #h(1fr) N72PE
		#columns(2)[
			#set text(8.1pt)
			#operating_checklists
		]
	]
]
#page(flipped: true, margin: margins, paper: "us-letter")[
	#columns(2, gutter: 2*margins)[
		#set text(heading_base_size)
		#box(fill: red, width: 100%,
		     align(center, box(fill: white, outset: 1em)[= Emergency Checklists]))
		#v(-.5em)
		#columns(2, gutter: 2mm)[
			#set text(8.5pt)
			#left_emergency_checklists
		]
		#colbreak()
		#box(fill: red, width: 100%,
		     align(center, box(fill: white, outset: 1em)[= Emergency Checklists]))
		#v(-.5em)
		#columns(2, gutter: 2mm)[
			#set text(7.7pt)
			#right_emergency_checklists
		]
	]
]
