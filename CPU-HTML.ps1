
$cpuUsage = Get-WmiObject Win32_PerfFormattedData_PerfOS_Processor | Select-Object -ExpandProperty PercentProcessorTime

$htmlReport = @"
<html>
<head>
<style>
    body { font-family: Arial, sans-serif; }
    table { border-collapse: collapse; width: 50%; }
    th, td { border: 1px solid black; padding: 8px; text-align: left; }
    th { background-color: #f2f2f2; }
</style>
</head>
<body>
<h2>System Monitoring Report - $currentDate</h2>
<table>
<tr><th>Resource</th><th>Value</th></tr>
<tr><td>CPU Usage (%)</td><td>$cpuUsage</td></tr>
</table>
</body>
</html>
"@

$htmlReport | Out-File -FilePath "C:\Report_$currentDate.html"
