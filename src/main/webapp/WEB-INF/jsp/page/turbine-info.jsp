<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="format-detection" content="telephone=no">
  <title>CMDS</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/static/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/static/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="/static/vendors/css/vendor.bundle.addons.css">
  	<link href="/static/vendors/css/datepicker.css" rel="stylesheet">

  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/static/css/style.css">
  <link rel="stylesheet" href="/static/css/ep-style.css">
  <!-- endinject -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-more.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>

    <style type="text/css">
        .highcharts-button{display:none;}
        .highcharts-contextbutton{display:none}
        .highcharts-button-normal{display:none;}
        .highcharts-credits { display:none;}
        
        /* ie hack */
        #ie-table-set {width:100px \0/IE8;/*IE8적용*/width:100% \0/IE9;/*IE9적용*/ height:50px  \0/IE8+9;/*IE8+9적용*/}
         
    </style>
</head>
<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-top justify-content-center">
            <a class="navbar-brand brand-logo" href="/index.html">
                <img src="/static/sample.png" alt="">
            </a>
            <a class="navbar-brand brand-logo-mini" href="/index.html">
                <img src="/static/sample.png" alt="">
            </a>
        </div>


        <div class="navbar-menu-wrapper d-flex align-items-center">


            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                <span class="mdi mdi-menu"></span>
            </button>
        </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <jsp:include page="../nav.jsp" flush="false"/>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4><strong>${unitName}</strong></h4><h5>(FARM Key - ${user.farmKey} CMS Key - ${user.cmsKey})</h5>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="col-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <form action="/page/turbine-info.html" method="get">
                                    <input type="hidden" name="farmKey" value="${farmKey}"/>
                                    <input type="hidden" name="cmsKey" value="${cmsKey}"/>
                                    <div class=" ep-form-serch">
                                        <div class="row">
                                            <div class="col-5 ep-form-item" style="padding:0 7px">
                                                <div class="input-group">
                                                    <input type="text" class="form-control datepicker start " name="startDate" placeholder="조회 시작">
                                                    <span class="input-group-addon"><i class=""></i></span>
                                                </div>
                                            </div>
                                            <div class="col-5 ep-form-item" style="padding:0 7px">
                                                <div class="input-group">
                                                    <input type="text" class="form-control datepicker end " name="endDate" placeholder="조회 종료일자">
                                                    <span class="input-group-addon"><i class=""></i></span>
                                                </div>
                                            </div>
                                            <div class="col-2 ep-form-item" style="padding:0 10px">
                                                <button class="ep-form-bt  primery"><i><img src="/static/images/search.png" alt=""/></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="card-body">


                                <div id="container"></div>

                                <div style="display:none">
                                    <!-- Source: http://or.water.usgs.gov/cgi-bin/grapher/graph_windrose.pl -->
                                    <table id="freq" border="0" cellspacing="0" cellpadding="0">
                                        <tr nowrap bgcolor="#CCCCFF">
                                            <th colspan="9" class="hdr"></th>
                                        </tr>
                                        <tr nowrap bgcolor="#CCCCFF">
                                            <th class="freq">Direction</th>
                                            <th class="freq">0-1.53 m/s</th>
                                            <th class="freq">1.54-3.08 m/s</th>
                                            <th class="freq">3.09-5.13 m/s</th>
                                            <th class="freq">5.14-8.22 m/s</th>
                                            <th class="freq">8.23-10.79 m/s</th>
                                            <th class="freq">10.80-15.79 m/s</th>
                                        </tr>
                                        <tr nowrap>
                                            <td class="dir">N</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['N']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap bgcolor="#DDDDDD">
                                            <td class="dir">NNE</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['NNE']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap>
                                            <td class="dir">NE</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['NE']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap bgcolor="#DDDDDD">
                                            <td class="dir">ENE</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['ENE']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap>
                                            <td class="dir">E</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['E']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap bgcolor="#DDDDDD">
                                            <td class="dir">ESE</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['ESE']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap>
                                            <td class="dir">SE</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['SE']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap bgcolor="#DDDDDD">
                                            <td class="dir">SSE</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['SSE']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap>
                                            <td class="dir">S</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['S']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap bgcolor="#DDDDDD">
                                            <td class="dir">SSW</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['SSW']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap>
                                            <td class="dir">SW</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['SW']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap bgcolor="#DDDDDD">
                                            <td class="dir">WSW</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['WSW']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap>
                                            <td class="dir">W</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['W']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap bgcolor="#DDDDDD">
                                            <td class="dir">WNW</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['WNW']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap>
                                            <td class="dir">NW</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['NW']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                        <tr nowrap bgcolor="#DDDDDD">
                                            <td class="dir">NNW</td>
                                            <c:forEach var="data" items="${windRoseGraphMap['NNW']}">
                                                <td class="data"><fmt:formatNumber value="${data * 100}" maxFractionDigits="2"/></td>
                                            </c:forEach>
                                        </tr>
                                    </table>
                                </div>

                            </div>

                            <div class="card-body">
                                <div id="container2" style="min-width: 310px; height: 400px; max-width: 800px; margin: 0 auto"></div>
                            </div>

                            <div class="card-body" style="position: relative;">
                                <div class="form-group" style="position: absolute; width: 20%; right: 26%; top: 5%; z-index: 10;">
                                    <select class="form-control" name="channel">
                                        <option value="">채널</option>
                                        <c:forEach var="channel" items="${channelList}">
                                            <option data-ch-no="${channel.chNo}" data-ch-type="${channel.chType}" value="${channel.chNo}_${channel.chType}">${channel.chName}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group" style="position: absolute; width: 20%; right: 5%; top: 5%; z-index: 10;">
                                    <select class="form-control" name="unit">
                                        <option value="">unit</option>
                                    </select>
                                </div>
                                <h4><strong>CMS Trend</strong></h4>
                                <div id="container3" style="min-width: 310px; height: 250px; margin: 0 auto"></div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row" style="margin-top: 30px">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <form class="form-inline">
                                    <div class="form-group" style="">
                                        <button type="button" class="_time_button btn btn-light col-3" data-type="HOUR">일</button>
                                        <button type="button" class="_time_button btn btn-light col-3" data-type="DAY">월</button>
                                        <button type="button" class="_time_button btn btn-light col-3" data-type="MONTH">년</button>
                                    </div>
                                </form>
                            </div>

                            <div class="card-body">
                                <h4><strong>Power Production</strong></h4>
                                <div id="container4" style="min-width: 310px; height: 250px; margin: 0 auto"></div>
                            </div>

                            <div class="card-body">
                                <h4><strong>Availability</strong></h4>
                                <div id="container5" style="min-width: 310px; height: 250px; margin: 0 auto"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- content-wrapper ends -->
            <!-- partial:partials/_footer.html -->
            <footer class="footer">
                <div class="container-fluid clearfix">
                    <span class="text-muted d-block text-center text-sm-left  pull-right text-right d-sm-inline-block">Copyright © 2019 SMI All rights reserved.</span>
                </div>
            </footer>
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->

<script src="/static/vendors/js/vendor.bundle.base.js"></script>
<script src="/static/vendors/js/vendor.bundle.addons.js"></script>
<script src="/static/js/off-canvas.js"></script>
<script src="/static/js/misc.js"></script>
<script src="/static/js/dashboard.js"></script>
<script src="/static/vendors/js/jquery-ui.min.js"></script>
<script src="/static/vendors/js/datepicker.js"></script>
<script src="/static/vendors/js/moment.js"></script>
<script type="text/javascript">
  <fmt:formatDate var="formatStartDate" value="${startDate}" pattern="yyyy-MM-dd"/>
  <fmt:formatDate var="formatEndDate" value="${endDate}" pattern="yyyy-MM-dd"/>
  $(document).ready(function () {
      $('input[name=startDate]').datepicker('setDate', new Date('${formatStartDate}'));
      $('input[name=endDate]').datepicker('setDate', new Date('${formatEndDate}'));
  });

  $('._time_button').on('click', function () {
      $('._time_button').removeClass('btn-primary');
      $('._time_button').addClass('btn-light');

      $(this).removeClass('btn-light');
      $(this).addClass('btn-primary');
  });
</script>
<script type="text/javascript">

  //Parse the data from an inline table using the Highcharts Data plugin
  Highcharts.chart('container', {
    colors: ['#002bf7', '#055bae', '#1cad5b', '#29fb3e', '#5eff40', '#b1fc40'],

      data: {
          table: 'freq',
          startRow: 1,
          endRow: 17,
          endColumn: 6
      },

      chart: {
          polar: true,
          type: 'column'
      },

      title: {
          text: ''
      },

      subtitle: {
          text: ''
      },

      pane: {
          size: '85%'
      },

      legend: {
          align: 'right',
          verticalAlign: 'top',
          y: 100,
          layout: 'vertical'
      },

      xAxis: {
          tickmarkPlacement: 'on'
      },

      yAxis: {
          min: 0,
          endOnTick: false,
          showLastLabel: true,
          title: {
              text: 'Frequency (%)'
          },
          labels: {
              formatter: function () {
                  return this.value + '%';
              }
          },
          reversedStacks: false
      },

      tooltip: {
          valueSuffix: '%'
      },

      plotOptions: {
          series: {
              stacking: 'normal',
              shadow: false,
              groupPadding: 0,
              pointPlacement: 'on'
          }
      }
  });
</script>
<script type="text/javascript">
  Highcharts.chart('container2', {
      chart: {
          type: 'scatter',
          zoomType: 'xy'
      },
      title: {
          text: ''
      },
      subtitle: {
          text: ''
      },
      xAxis: {
          title: {
              enabled: true,
              text: 'wind speed [m/s]'
          },
          min: 0,
          max: 25,
          startOnTick: true,
          endOnTick: true,
          showLastLabel: true
      },
      yAxis: {
          title: {
              text: 'wind power[kW]'
          }
      },

      plotOptions: {
          scatter: {
              marker: {
                  radius: 5,
                  states: {
                      hover: {
                          enabled: true,
                          lineColor: 'rgb(100,100,100)'
                      }
                  }
              },
              states: {
                  hover: {
                      marker: {
                          enabled: false
                      }
                  }
              },
              tooltip: {
                  headerFormat: '<b>{series.name}</b><br>',
                  pointFormat: '{point.x} m/s, {point.y} kW'
              }
          }
      },
      series: [
          {
              showInLegend: false,
              name: 'DATA',
              color: 'rgb(124, 181, 236)',
              data: [
                  <c:forEach var="data" items="${turbineScadaList}" varStatus="status">
                  <c:if test="${status.index > 0}">, </c:if>[${data.windSpeed}, ${data.windPower}]
                  </c:forEach>
              ],
              marker: {
                  enable: true,
                  symbol: "circle",
                  radius: 1.0
              }
          },
          {
              showInLegend: false,
              name: 'HH',
              color: 'rgb(255, 0, 0)',
              data: [
                  <c:if test="${not empty turbinePowerCurveGraphMap['HH']}">
                      <c:forEach var="data" items="${turbinePowerCurveGraphMap['HH']}" varStatus="status2">
                        <c:if test="${status2.index > 0}">, </c:if>[${status2.index * 0.1}, ${data}]
                      </c:forEach>
                  </c:if>
              ],
              marker: {
                  enable: true,
                  symbol: "circle",
                  radius: 1.0
              }
          },
          {
              showInLegend: false,
              name: 'H',
              color: 'rgb(255, 200, 0)',
              data: [
                  <c:if test="${not empty turbinePowerCurveGraphMap['H']}">
                  <c:forEach var="data" items="${turbinePowerCurveGraphMap['H']}" varStatus="status2">
                  <c:if test="${status2.index > 0}">, </c:if>[${status2.index * 0.1}, ${data}]
                  </c:forEach>
                  </c:if>
              ],
              marker: {
                  enable: true,
                  symbol: "circle",
                  radius: 1.0
              }
          },
          {
              showInLegend: false,
              name: 'L',
              color: 'rgb(255, 200, 0)',
              data: [
                  <c:if test="${not empty turbinePowerCurveGraphMap['L']}">
                  <c:forEach var="data" items="${turbinePowerCurveGraphMap['L']}" varStatus="status2">
                  <c:if test="${status2.index > 0}">, </c:if>[${status2.index * 0.1}, ${data}]
                  </c:forEach>
                  </c:if>
              ],
              marker: {
                  enable: true,
                  symbol: "circle",
                  radius: 1.0
              }
          },
          {
              showInLegend: false,
              name: 'LL',
              color: 'rgb(255, 0, 0)',
              data: [
                  <c:if test="${not empty turbinePowerCurveGraphMap['LL']}">
                  <c:forEach var="data" items="${turbinePowerCurveGraphMap['LL']}" varStatus="status2">
                  <c:if test="${status2.index > 0}">, </c:if>[${status2.index * 0.1}, ${data}]
                  </c:forEach>
                  </c:if>
              ],
              marker: {
                  enable: true,
                  symbol: "circle",
                  radius: 1.0
              }
          }
      ]
  });

</script>
<script>
  var cmdsTrendChart = Highcharts.chart('container3', {
      title: {
          text: ''
      },
      subtitle: {
          text: ''
      },
      xAxis: {
          type: 'datetime',
          dateTimeLabelFormats: {
              millisecond: '%Y-%m-%d %H:%M:%S',
              second: '%Y-%m-%d %H:%M:%S',
              minute: '%Y-%m-%d %H:%M',
              hour: '%Y-%m-%d %H',
              day: '%Y-%m-%d',
              week: '%Y-%m-%d',
              month: '%Y-%m',
              year: '%Y'
          }
      },
      yAxis: {
          title: {
              text: 'UNIT_AVG'
          }
      },
      series: [{
          name: 'Active Bin 0',
          data: []
      }, {
          name: 'Active Bin 1',
          data: []
      }, {
          name: 'Active Bin 2',
          data: []
      }, {
          name: 'Active Bin 3',
          data: []
      }, {
          name: 'Active Bin 4',
          data: []
      }, {
          name: 'Active Bin 5',
          data: []
      }]
  });

  $(document).ready(function() {
      $('select[name=channel]').change(function() {
        var $selected = $(this).find('option:selected');
          if (!$selected.val()) {
              return;
          }

          $.get(
              '/api/unitList',
            {
              farmKey: $('input[name=farmKey]').val(),
              cmsKey: $('input[name=cmsKey]').val(),
              chNo: $selected.data('ch-no'),
              chType: $selected.data('ch-type')
            }
          ).done(function(result) {
            console.log(result);
            var $unitList = $('select[name=unit]');
            $unitList.empty();
            $unitList.append('<option value="">unit</option>');
            for (var i = 0; i < result.length; i++) {
              var unit = result[i];
              $unitList.append('<option data-ch-no="' + unit.chNo + '" data-ch-type="' + unit.chType + '" data-unit-no="' + unit.unitNo + '" value="' + unit.unitNo + '">' + unit.unitName + '</option>');
            }
          }).fail(function (response) {
              if (response.status === 401) {
                  location.reload();
              }
          });
      });

    $('select[name=unit]').change(function() {
      var $selected = $(this).find('option:selected');
      if (!$selected.val()) {
        return;
      }

      $.get(
        '/api/cmsTrend',
        {
          farmKey: $('input[name=farmKey]').val(),
          cmsKey: $('input[name=cmsKey]').val(),
          chNo: $selected.data('ch-no'),
          chType: $selected.data('ch-type'),
          unitNo: $selected.data('unit-no'),
          startDate: $('input[name=startDate]').val(),
          endDate: $('input[name=endDate]').val()
        }
      ).done(function(result) {
        console.log(result);
        cmdsTrendChart.series[0].setData(transformStageBin(result, 0));
        cmdsTrendChart.series[1].setData(transformStageBin(result, 1));
        cmdsTrendChart.series[2].setData(transformStageBin(result, 2));
        cmdsTrendChart.series[3].setData(transformStageBin(result, 3));
        cmdsTrendChart.series[4].setData(transformStageBin(result, 4));
        cmdsTrendChart.series[5].setData(transformStageBin(result, 5));
      }).fail(function (response) {
        if (response.status === 401) {
          location.reload();
        }
      });
    })
  });

  function transformStageBin(result, number) {
      var stageBin = [];
      var data = result['stageBin' + number];
      for (var i = 0; i < data.length; i++) {
          var item = data[i];
          var datetime = moment(item.dt, 'YYYYMMDDHHmmss').toDate().getTime();
          stageBin.push([datetime, item.unitAvg]);
      }
      return stageBin;
  }
</script>
<script type="text/javascript">
  Highcharts.setOptions({
    global : {
      useUTC : false
    }
  });

    var powerProductionChart = Highcharts.chart('container4', {
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },
        xAxis: {
            type: 'datetime',
            dateTimeLabelFormats: {
                millisecond: '%Y-%m-%d %H:%M:%S',
                second: '%Y-%m-%d %H:%M:%S',
                minute: '%Y-%m-%d %H:%M',
                hour: '%Y-%m-%d %H',
                day: '%Y-%m-%d',
                week: '%Y-%m-%d',
                month: '%Y-%m',
                year: '%Y'
            },
            max: Date.now()
        },
        yAxis: {
            title: {
                text: ''
            }
        },
          plotOptions: {
            column: {
              /* Here is the setting to limit the maximum column width. */
              maxPointWidth: 10
            }
          },
        series: [
            {
                showInLegend: false,
                name: 'Power Production',
                data: []
            }
        ]
    });

    function transformPowerProduction(data) {
        var result = [];
        for (var i = 0; i < data.length; i++) {
            var item = data[i];
            var datetime = moment(item.dt, 'YYYYMMDDHHmmss').toDate().getTime();
            result.push([datetime, item.totalWhDiff]);
        }
        return result;
    }

</script>
<script type="text/javascript">
    var availabilityChart = Highcharts.chart('container5', {
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },
        xAxis: {
            type: 'datetime',
            dateTimeLabelFormats: {
                millisecond: '%Y-%m-%d %H:%M:%S',
                second: '%Y-%m-%d %H:%M:%S',
                minute: '%Y-%m-%d %H:%M',
                hour: '%Y-%m-%d %H',
                day: '%Y-%m-%d',
                week: '%Y-%m-%d',
                month: '%Y-%m',
                year: '%Y'
            },
          max: Date.now()
        },
        yAxis: {
            title: {
                text: ''
            }
        },
      plotOptions: {
        column: {
          /* Here is the setting to limit the maximum column width. */
          maxPointWidth: 10
        }
      },
        series: [
            {
                showInLegend: false,
                name: 'Availability',
                data: []
            }
        ]
    });

    function transformAvailability(data) {
        var result = [];
        for (var i = 0; i < data.length; i++) {
            var item = data[i];
            var datetime = moment(item.dt, 'YYYYMMDDHHmmss').toDate().getTime();
            result.push([datetime, item.availability]);
        }
        return result;
    }

</script>
<script>
  $(document).ready(function () {
    $('._time_button').on('click', function () {
      var type = $(this).data('type');
      $.get(
        '/api/turbineStats',
        {
          farmKey: $('input[name=farmKey]').val(),
          cmsKey: $('input[name=cmsKey]').val(),
          dateType: type
        }
      ).done(function (result) {
        console.log(result);

        powerProductionChart.series[0].setData(transformPowerProduction(result.data));
        powerProductionChart.xAxis[0].update({
          min: result.startDate,
          max: result.endDate
        });

        availabilityChart.series[0].setData(transformAvailability(result.data));
        availabilityChart.xAxis[0].update({
          min: result.startDate,
          max: result.endDate
        });

      }).fail(function (response) {
        if (response.status === 401) {
          location.reload();
        }
      });
    });

    $('._time_button[data-type=HOUR]').trigger('click');
  });
</script>
</body>
</html>
