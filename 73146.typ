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

#import "common.typ": checklist, checklist_group, container, palette

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
		([Avionics], [ON]),
		([Headset], [ON]),
		([Flaps], [RETRACT]),
		([Weather], [OBTAIN]),
		([Altimeter], [SET]),
		([EFB Setup], [AS DESIRED]),
		([Navigation, landing lights], [ON]),
	)
	#checklist("Run-up", palette.light_green,
		([Instruments], [CHECK and SET]),
		([VOR Check], [IF NEEDED]),
		([Brakes], [SET]),
		([Doors and windows], [CLOSED, LOCKED]),
		([Flight controls], [FREE and CORRECT]),
		([Fuel valve], [BOTH]),
		([Mixture], [RICH (below 3000 feet)]),
		([Throttle], [1700 RPM]),
		([Magnetos], [CHECK], [Max drop 125 RPM, max diff. 50 RPM]),
		([Engine gauges, ammeter], [CHECK]),
		([Vacuum gauge], [CHECK]),
		([Carburetor heat], [TEST]),
		([Idle], [TEST]),
		([Mixture], [GROUND LEAN]),
		([Throttle friction], [ADJUST]),
	)
	#checklist("Before Takeoff", palette.dark_green,
		([Radios], [SET]),
		([Instruments], [SET]),
		([Takeoff briefing], [COMPLETE]),
		([Beacon, navigation, landing lights], [ON]),
		([Carburetor heat], [AS REQUIRED]),
		([Flaps], [0-10°]),
		([Trim], [TAKEOFF]),
		([Fuel valve], [BOTH]),
		([Fuel quantity], [CHECK]),
		([Mixture], [RICH (below 3000 feet)]),
	)
	#checklist("Climb", palette.light_blue,
		([Airspeed], [70-90 KIAS]),
		([Throttle], [FULL]),
		([Mixture], [RICH (lean above 3000 feet)]),
	)
	#checklist("Cruise", palette.dark_blue,
		([Power], [2200-2700 RPM], [No more than 75% power]),
		([Trim], [ADJUST]),
		([Mixture], [LEAN (for max RPM)]),
	)
	#checklist("Descent", palette.light_green,
		([Mixture], [RICH]),
		([Power], [AS DESIRED]),
		([Carburetor heat], [AS REQUIRED], [To prevent carburetor icing]),
	)
	#checklist("Before Landing", palette.brown,
		([Fuel valve], [BOTH]),
		([Mixture], [RICH]),
		([Carburetor heat], [ON], [Apply full heat before closing throttle]),
		([Airspeed], [60-70 KIAS (flaps UP)]),
		([Flaps], [AS DESIRED]),
		([Airspeed], [55-65 KIAS (flaps DOWN)]),
	)
	#checklist("Balked Landing", palette.purple,
		([Throttle], [FULL]),
		([Carburetor heat], [COLD]),
		([Flaps], [20°]),
		([Airspeed], [55 KIAS]),
		([Flaps], [RETRACT slowly]),
	)
	#checklist("After Landing", palette.dark_green,
		([Flaps], [UP]),
		([Caburetor heat], [OFF]),
		([Mixture], [GROUND LEAN]),
	)
	// POH Title: SECURING AIRPLANE. I split the checklist into two: the
	// Shutdown checklist here and the Securing checklist on the ground
	// checklist page.
	#checklist("Shutdown", palette.black,
		([Brakes], [SET]),
		([Tach time], [RECORD]),
		([Radios, electrical equipment], [OFF]),
		([Mixture], [CUT-OFF]),
		([Magnetos], [OFF]),
		([Master], [OFF]),
	)
]

// -----------------------------------------------------------------------------
// Emergency Checklists (left side)
// -----------------------------------------------------------------------------
#let left_emergency_checklists = [
	#checklist("Engine Failure During Takeoff Run", palette.brown,
		emergency: true,
		([Throttle], [IDLE]),
		([Brakes], [APPLY]),
		([Flaps], [RETRACT]),
		([Mixture], [CUT-OFF]),
		([Magnetos], [OFF]),
	)
	// The title in the POH is "ENGINE FAILURE IMMEDIATELY AFTER TAKEOFF" but
	// that didn't fit on one line so immediately was replaced with shortly.
	#checklist("Engine Failure Shortly After Takeoff", palette.dark_blue,
		emergency: true,
		([Airspeed], align(right)[Flaps up: 65 KIAS\ Flaps down: 60 KIAS]),
		([Mixture], [CUT-OFF]),
		([Fuel valve], [OFF]),
		([Magnetos], [OFF]),
		([Flaps], [AS REQUIRED]),
		([Master], [OFF]),
	)
	#checklist("Engine Failure During Flight", palette.purple, emergency: true,
		([Airspeed], [65 KIAS]),
		([Carburetor heat], [ON]),
		([Fuel valve], [BOTH]),
		([Mixture], [RICH]),
		([Magnetos], [BOTH], [(START if prop stopped)]),
		([Primer], [IN and LOCKED]),
	)
	// POH title: EMERGENCY LANDING WITHOUT ENGINE POWER, reworded to fit on one
	// line.
	// Note: The Engine Fire in Flight checklist mentions this checklist by
	// name; if the name is changed here it should be changed there as well.
	#checklist("Forced Landing With Engine Failure", palette.light_green,
		emergency: true,
		([Airspeed], align(right)[Flaps up: 65 KIAS\ Flaps down: 60 KIAS]),
		([Mixture], [CUT-OFF]),
		([Fuel valve], [OFF]),
		([Magnetos], [OFF]),
		([Flaps], [AS REQUIRED], [40° recommended]),
		([Master], [OFF]),
		([Doors], [UNLATCH BEFORE TOUCHDOWN]), // "prior to" -> "before" for space
		([Touchdown], [SLIGHTLY TAIL LOW]),
		([Brakes], [APPLY HEAVILY]),
	)
	#colbreak()
	// POH title: PRECAUTIONARY LANDING WITH ENGINE POWER. Removed "with engine
	// power" to fit on one line.
	#checklist("Precautionary Landing", palette.dark_green, emergency: true,
		([Flaps], [20°]),
		([Airspeed], [60 KIAS]),
		([Selected field], [FLY OVER], [Note terrain/obstructions.\ Retract
			flaps upon reaching\ a safe altitude and airspeed.]),
		([Radios, electrical switches], [OFF]),
		([Flaps], [40° (on final approach)]),
		([Airspeed], [60 KIAS]),
		([Master], [OFF]),
		([Doors], [UNLATCH BEFORE TOUCHDOWN]), // "prior to" -> "before" for space
		([Touchdown], [SLIGHTLY TAIL LOW]),
		([Magnetos], [OFF]),
		([Brakes], [APPLY HEAVILY]),
	)
	#checklist("Ditching", palette.light_blue, emergency: true,
		([Radio], [MAYDAY on 121.5 MHz], [Give location, intentions]),
		([Heavy objects], [SECURE or JETTISON]),
		([Flaps], [20°-40°]),
		([Power], [300 FT/MIN DESCENT AT 55 KIAS],
		 [If no power available, approach\ flaps up 65 KIAS or flaps 10° 60 KIAS]),
		([Strong wind, heavy seas:\ #h(1em)LAND INTO WIND\
		  Light wind, heavy swells:\ #h(1em)LAND PARALLEL TO SWELLS], []),
		([Doors], [UNLATCH]),
		([Touchdown], [LEVEL ATTITUDE], [at established rate of descent]),
		([Face], [CUSHION at touchdown with coat]),
		([Airplane], [EVACUATE]),
		([Life vests/raft], [INFLATE]),
	)
]

// -----------------------------------------------------------------------------
// Emergency Checklists (right side)
// -----------------------------------------------------------------------------
#let right_emergency_checklists = [
	#checklist("Engine Fire During Start On Ground", palette.light_green,
		emergency: true,
		([Cranking], [CONTINUE]),
		([If engine starts:], []),
		([#h(1em)Power], [1700 RPM for a few minutes]),
		([#h(1em)Engine], [SHUTDOWN]),
		([If engine fails to start:], []),
		([#h(1em)Throttle], [FULL OPEN]),
		([#h(1em)Mixture], [CUT-OFF]),
		([#h(1em)Cranking], [CONTINUE for 2-3 minutes]),
		([#h(1em)Fire extinguisher], [OBTAIN]),
		([#h(1em)Master], [OFF]),
		([#h(1em)Magnetos], [OFF]),
		([#h(1em)Fuel valve], [OFF]),
		([#h(1em)Fire], [EXTINGUISH],
		 [Use fire extinguisher, seat cushion,\ wool blanket, or dirt.
		  If practical, try\ to remove air filter if it is ablaze.]),
		([Both cases: inspect and repair damage before conducting another flight.], []),
	)
	#checklist("Engine Fire in Flight", palette.purple, emergency: true,
		([Mixture], [CUT-OFF]),
		([Fuel valve], [OFF]),
		([Master], [OFF]),
		([Cabin heat & air], [OFF], [(except overhead vents)]),
		([Airspeed], [100 KIAS],
		 [If fire is not extinguished, increase\ glide speed to find an airspeed
		  which\ will provide an incombustible mixture]),
		([Forced Landing With\ Engine Failure checklist], [EXECUTE]),
	)
	#checklist("Electrical Fire in Flight", palette.dark_blue, emergency: true,
		([Master], [OFF]),
		([All other switches (except magnetos)], [OFF]),
		([Vents/cabin air/heat], [CLOSE]),
		([Fire extinguisher], [USE]),
		([If fire appears out and electrical power is necessary to continue flight:], []),
		([#h(1em)Master], [ON]),
		([#h(1em)Circuit breakers], [CHECK], [(do not reset faulty circuit)]),
		([#h(1em)Radio/electrical switches], [ON],
		 [One at a time with delay after\ each until short circuit is
		  localized]),
		([#h(1em)Vents/cabin air/heat], [OPEN],
		 [(when fire completely extinguished)]),
	)
	#checklist("Cabin Fire", palette.light_blue, emergency: true,
		([Master], [OFF]),
		([Vents/cabin air/heat], [CLOSED], [(to avoid drafts)]),
		([Fire extinguisher], [USE],
		 [WARNING: After discharging extinguisher within a closed cabin,
		  ventilate cabin]),
		([Land ASAP, inspect for damage], []),
	)
	#checklist("Wing Fire", palette.brown, emergency: true,
		([Nav lights], [OFF]),
		([Pitot heat], [OFF]),
		([NOTE: Sideslip to keep flames away from fuel tanks and cabin.
		  Land ASAP using flaps only as required.], []),
	)
	#checklist("Inadvertent Icing Encounter", palette.light_blue, emergency: true,
		([Pitot heat], [ON]),
		([Turn back or change altitude to obtain an OAT less conducive to icing.], []),
		([Cabin heat], [FULL ON]),
		([Defroster], [OPEN]),
		([Cabin air], [ADJUST], [Maximize defroster heat and airflow]),
		([Throttle], [OPEN]),
		([Carburetor/air filter icing], [MONITOR],
			[Apply carb heat as required, lean mixture\ for maximum RPM if used
			continuously]),
		([Land], [NEAREST AIRPORT], [With very rapid ice build-up, select\
			suitable off-airport landing site]),
		([With ≥ 1/4 inch ice on the leading edges, prepare for significantly higher
		  stall speed], []),
		([Flaps], [LEAVE RETRACTED]),
		([Open left window and scrape ice from windshield, if necessary for visibility], []),
		([Forward slip if necessary for visibility], []),
		([Approach speed], [65-75 KIAS], [Depending on level of accumulation]),
		([Landing], [Perform in level attitude]),
	)
	// POH title: STATIC SOURCE BLOCKAGE (Erroneous Instrument Reading
	// Suspected). Removed "(Erroneous Instrument Reading Suspected)" to fit on
	// one line.
	#checklist("Static Source Blockage", palette.dark_green, emergency: true,
		([Alternate static source valve], [PULL ON]),
		([Airspeed], [Use calibration table\ in POH section 5]),
	)
	#checklist("Landing With a Flat Main Tire", palette.brown, emergency: true,
		([Approach], [NORMAL]),
		([Touchdown], [GOOD TIRE FIRST], [Hold airplane off flat tire as long as possible]),
	)
	#checklist("Over-Voltage Light Illuminates", palette.light_green, emergency: true,
		([Master], [OFF (both sides)]),
		([Master], [ON]),
		([If over-voltage light illuminates again:], []),
		([#h(1em)Flight], [TERMINATE ASAP]),
	)
	#checklist("Ammeter Shows Discharge", palette.black, emergency: true,
		([Alternator], [OFF]),
		([Nonessential electrical equipment], [OFF]),
		([Flight], [TERMINATE as soon as practical]),
	)
]

// -----------------------------------------------------------------------------
// Ground Checklists and Information page
// -----------------------------------------------------------------------------
#let ground_checklists_and_info = [
	#checklist("Preflight", palette.brown,
		checklist_group("Fluids"),
		([Magnetos], [OFF]),
		([Fuel quantity], [CHECK VISUALLY]),
		([Fuel sumps], [DRAIN],
		 [Left wing, right wing, fuel strainer.\ Inspect for contamination.]),
		([Fuel filler caps], [SECURE]),
		([Engine oil level], [CHECK], [Minimum 6 quarts]),
		checklist_group("Cabin"),
		([Pitot cover], [REMOVE]),
		([POH], [VERIFY PRESENT]),
		([Master], [ON]),
		([Flaps], [EXTEND]),
		([Fuel gauges], [CHECK QUANTITY]),
		([Lights], [CHECK]),
		([Tach time], [RECORD]),
		([Pitot heat], [TEST]),
		([Master], [OFF]),
		([Fire extinguisher], [SECURE]),
		([Control lock], [REMOVE]),
		checklist_group("Empennage"),
		([Rudder gust lock], [REMOVE]),
		([Control surfaces], [CHECK], [Freedom of movement and security]),
		checklist_group("Right"),
		([Main wheel tire], [CHECK INFLATION]),
		([Aileron], [CHECK], [Freedom of movement and security]),
		checklist_group("Nose"),
		([Propeller, spinner], [CHECK], [For nicks and security]),
		([Landing light], [CHECK CLEAR]),
		([Air filter], [CHECK CLEAR]),
		([Nosewheel & strut], [CHECK INFLATED]),
		([Static source], [CHECK CLEAR]),
		checklist_group("Left"),
		([Main wheel tire], [CHECK INFLATION]),
		([Fuel tank vent], [CHECK CLEAR]),
		([Pitot tube], [CHECK CLEAR]),
		([Stall warning], [TEST]),
		([Aileron], [CHECK], [Freedom of movement and security]),
		checklist_group("Final"),
		([Flight Circle], [DISPATCH]),
		([Tach, Hobbs times], [RECORD]),
		([Baggage door], [LOCK]),
		([Chocks], [REMOVE]),
		([Tie-downs], [REMOVE]),
	)
	#checklist("Securing", palette.black,
		([Control lock], [INSTALL]),
		([Tie-downs, chocks], [APPLY]),
		([Vents, windows], [CLOSE]),
		([Pitot cover], [APPLY]),
		([Tach, Hobbs times], [RECORD]),
		([Flight Circle], [CHECK IN]),
		([Doors], [LOCK]),
	)
	#container("Speeds", palette.purple, {
		set par(leading: 0.3em)
		table(
			align: (left + horizon, center, center),
			columns: (auto, 1fr, auto),
			inset: (x: 0em, y: .4em),
			stroke: (x: none),
			table.hline(stroke: none),
			[], [], table.cell(inset: (top: 0em))[KIAS],
			[Best glide (V#sub[G])], [], [65],
			[Best angle\ of climb (V#sub[X])], [Sea level\ 10,000 ft], [64\ 62],
			[Best rate\ of climb (V#sub[Y])], [Sea level\ 10,000 ft], [78\ 68],
			[Landing approach], box(align(left)[Flaps up\ Flaps 40]),
				[60-70\ 55-65],
			[Normal takeoff climb], [], [70-80],
			[Short-field\ takeoff climb], box(align(left)[Flaps up\ Flaps 10]),
				[59\ 55],
			[Normal enroute\ climb], [Sea level\ 10,000 ft], [80-90\ 70-80],
			table.cell(
				inset: (bottom: 0em))[Design maneuvering\ speed (V#sub[A])],
				table.cell(inset: (bottom: 0em),
					[2300 lbs\ 1950 lbs\ 1600 lbs]),
				table.cell(inset: (bottom: 0em), [97\ 89\ 80]),
			table.hline(stroke: none),
		)
	})
]

// -----------------------------------------------------------------------------
// Page definitions and formatting
// -----------------------------------------------------------------------------

#set text(fallback: false, font: "DejaVu Sans")

#let heading_base_size = 10pt
#let margins = 5mm
#page(flipped: true, margin: margins, paper: "us-letter")[
	// page() supports multiple columns, but does not support setting the gutter
	// width for multiple columns, so we call columns() ourselves instead.
	#columns(2, gutter: 2*margins)[
		#set text(heading_base_size)
		= Ground Checklists and Information #h(1fr) N73146
		#columns(2)[
			#set text(8.5pt)
			#ground_checklists_and_info
		]
		#v(1fr)
		= Version 1 #h(1fr) #include "signature.typ"
		#colbreak()
		= Operating Checklists #h(1fr) N73146
		#columns(2)[
			#set text(7.5pt)
			#operating_checklists
		]
	]
]
#page(flipped: true, margin: margins, paper: "us-letter")[
	#columns(2, gutter: 2*margins)[
		#set text(heading_base_size)
		#box(fill: red, width: 100%,
		     align(center, box(fill: white, outset: 1em)[= Engine Failures, Forced Landings]))
		#v(-.5em)
		#columns(2, gutter: 2mm)[
			#set text(8.5pt)
			#left_emergency_checklists
		]
		#colbreak()
		#box(fill: red, width: 100%,
		     align(center, box(fill: white, outset: 1em)[= Fires, Icing, Flat Tire, Electrical]))
		#v(-.5em)
		#columns(2, gutter: 2mm)[
			#set text(7.6pt)
			#right_emergency_checklists
		]
	]
]
