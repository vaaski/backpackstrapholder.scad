/* [main settings] */

strap_width = 20;
strap_depth = 3.7;

holder_height = 5;
holder_thickness = 2;
opening_size = 4;

holder_roundness = 0.25;

// things below this won't show up in the customizer
module __Customizer_Limit__() {}

module round(roundness = 1) {
  offset(roundness) offset(-2 * roundness) offset(roundness)
  children();
}

opening_poly = [
  [0, 0],
  [-opening_size, -opening_size * 1.25],
  [opening_size, -opening_size * 1.25]
];

// set quality, 64 for testing, 128 for rendering
$fn = $preview ? 64 : 128;

// overlap to make the preview pretty
__OVERLAP = $preview ? 0.001 : 0;

module footprint() difference () {
  square([strap_width + holder_thickness * 2, strap_depth + holder_thickness * 2], center = true);

  square([strap_width, strap_depth], center = true);

  polygon(opening_poly);
}

linear_extrude(holder_height)
round(holder_roundness)
footprint();
