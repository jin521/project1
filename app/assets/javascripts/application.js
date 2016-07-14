// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var DateBox = React.createClass({
  render: function() {
    var date   = new Date();
    var hour   = date.getHours() % 12 || 12;
    var minute = date.getMinutes();
    var second = date.getSeconds();
    minute     = checkTime(minute);
    second     = checkTime(second);

    function checkTime(i) {
        if (i < 10) {
            i = "0" + i
        };
        return i;
    }

    return (
        <h1>{hour}<span>:</span>{minute}</h1>
    );
  }
});

// Render
ReactDOM.render(
  <DateBox />,
  document.getElementById('time')
);
