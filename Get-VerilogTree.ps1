param([string]$Path = ".", [string]$OutputFile = "verilog_tree.md")
$c1 = [char]9492 + [char]9472 + [char]9472 + " "
$c2 = [char]9500 + [char]9472 + [char]9472 + " "
$c3 = [char]9474 + "   "
$c4 = "    "
function Show-Node($dir,$indent) {
    $subdirs = Get-ChildItem -LiteralPath$dir -Directory -Exclude ".git" -ErrorAction SilentlyContinue | Where-Object {
        Get-ChildItem -LiteralPath $_.FullName -Filter "*.v" -Recurse -File -ErrorAction SilentlyContinue | Select-Object -First 1
    } | Sort-Object Name
    $vfiles = Get-ChildItem -LiteralPath$dir -File -Filter "*.v" -ErrorAction SilentlyContinue | Sort-Object Name
    $all = @($subdirs) + @($vfiles)
    $lines = @()
    for ($i = 0; $i -lt $all.Count; $i++) {
        $isLast = ($i -eq ($all.Count - 1))
        if ($isLast) { $b =$c1; $p =$c4 } else { $b =$c2; $p =$c3 }
        $subIndent = $indent +$p
        if ($all[$i].PSIsContainer) {
            $lines += ($indent +$b + $all[$i].Name + "/")
            $lines += Show-Node$all[$i].FullName $subIndent
        } else {
            $lines += ($indent +$b + $all[$i].Name)
        }
    }
    return $lines
}
$res = (Resolve-Path$Path).Path
$root = Split-Path$res -Leaf
$tree = @($root + "/") + (Show-Node $res "")
$tree | ForEach-Object {
    if ($_ -like "*/") { Write-Host $_ -ForegroundColor Cyan } else { Write-Host$_ }
}
if ($OutputFile) {
    $out = [System.IO.Path]::GetFullPath((Join-Path (Get-Location)$OutputFile))
    $md = @("```text") + $tree + @("```")
    [System.IO.File]::WriteAllLines($out, $md, [System.Text.Encoding]::UTF8)
    Write-Host "`nSaved tree to: $out" -ForegroundColor Green
}
