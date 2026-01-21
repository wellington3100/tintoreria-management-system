$fecha = Get-Date -Format "yyyy-MM-dd"
Add-Content README_DIARIO.md "`n## $fecha`n- Avance diario"

git add .
git commit -m "Daily update $fecha"
git push
