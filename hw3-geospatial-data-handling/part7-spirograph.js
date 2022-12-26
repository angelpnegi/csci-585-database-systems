var R = 6,r = 1,a = 8;
var x, y, z;
z = 0;
s = "<Placemark>\n<styleUrl>#z1</styleUrl><Point><coordinates>-118.28544584065139,34.020561606925355</coordinates></Point>\n</Placemark>\n";
for (var t = 0.0; t < Math.PI * 16; t += 0.01) {
x = (R + r) * Math.sin((r / R) * t) - a * Math.sin((1 + r / R) * t);
x = 34.020561606925355 + 0.001 * x;
y = (R + r) * Math.cos((r / R) * t) - a * Math.cos((1 + r / R) * t);
y = -118.28544584065139 + 0.0012 * y;
document.write(y + " , " + x + "<br>");
z += 1;
s +=
    "<Placemark>\n<styleUrl>#z1</styleUrl><Point><coordinates>" +
    y +
    "," +
    x +
    "</coordinates></Point>\n</Placemark>\n";
}
console.log(z);
console.log(s);



