#!/bin/bash

WEB_DIR=/var/www/html/control
echo '<HTML>
    <head>
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
    </head>
<BODY>' > $WEB_DIR/report.html
echo '<div class="limiter">
            <div class="container-table100">
                <div class="wrap-table100">
                    <div class="table100 ver1 m-b-110">
                        <div class="table100-head">
                            <table>
                                <thead>
                                    <tr class="row100 head">
                                        <th class="cell100 column1">Filesystem</th>
                                        <th class="cell100 column2-head">Size</th>
                                        <th class="cell100 column3-head">Available</th>
                                        <th class="cell100 column4-head">Use %</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table100-body js-pscroll">
                                <table>
                                    <tbody>
                                    <tr class="row100 body">' >> $WEB_DIR/report.html
# read output
while read line; do

echo '<td class="cell100 column1">' >> $WEB_DIR/report.html
echo $line | awk '{print $1}' >> $WEB_DIR/report.html
echo '</td><td class="cell100 column2">' >> $WEB_DIR/report.html
echo $line | awk '{print $2}' >> $WEB_DIR/report.html
echo '</td><td class="cell100 column3">' >> $WEB_DIR/report.html
echo $line | awk '{print $4}' >> $WEB_DIR/report.html
echo '</td><td class="cell100 column4">' >> $WEB_DIR/report.html
echo $line | awk '{print $5}' >> $WEB_DIR/report.html
echo '</td><td class="cell100 column4"></tr>' >> $WEB_DIR/report.html
done < <(df -h | grep -vi filesystem)
echo "</table></BODY></HTML>" >> $WEB_DIR/report.html
