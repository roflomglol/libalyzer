//////////////////////////////////////////////////////////////
//////////////////////// Set-Up //////////////////////////////
//////////////////////////////////////////////////////////////

var margin = {top: 100, right: 100, bottom: 100, left: 100},
  width = Math.min(700, window.innerWidth - 10) - margin.left - margin.right,
  height = Math.min(width, window.innerHeight - margin.top - margin.bottom - 20);

//////////////////////////////////////////////////////////////
////////////////////////// Data //////////////////////////////
//////////////////////////////////////////////////////////////
var radar_container = document.getElementById('radarChart');
var report_json = JSON.parse(radar_container.dataset.report);
var data = [
  report_json
];

//////////////////////////////////////////////////////////////
//////////////////// Draw the Chart //////////////////////////
//////////////////////////////////////////////////////////////

var color = d3.scale.ordinal()
  .range(["#EDC951","#CC333F","#00A0B0"]);

var radarChartOptions = {
  w: width,
  h: height,
  margin: margin,
  maxValue: 0.5,
  levels: 5,
  roundStrokes: true,
  color: color
};
//Call function to draw the Radar chart
RadarChart("#radarChart", data, radarChartOptions);
