#!/bin/bash

# Script helper para verificar y testear el MCP Server de Laravel Boost

echo "🚀 Verificando configuración del MCP Server..."
echo ""

# Verificar que Laravel Boost está instalado
echo "📦 Verificando Laravel Boost..."
if composer show laravel/boost &> /dev/null; then
    echo "✅ Laravel Boost está instalado"
    composer show laravel/boost | grep versions
else
    echo "❌ Laravel Boost NO está instalado"
    echo "   Ejecuta: composer require laravel/boost --dev"
    exit 1
fi

echo ""

# Verificar archivo de configuración
echo "📄 Verificando archivos de configuración..."
if [ -f ".github/copilot-mcp.json" ]; then
    echo "✅ Archivo .github/copilot-mcp.json existe"
else
    echo "❌ Archivo .github/copilot-mcp.json NO existe"
fi

if [ -f ".mcp.json" ]; then
    echo "✅ Archivo .mcp.json existe"
else
    echo "❌ Archivo .mcp.json NO existe"
fi

echo ""

# Verificar que artisan funciona
echo "🔧 Verificando comandos artisan..."
if php artisan list | grep -q "boost:mcp"; then
    echo "✅ Comando boost:mcp disponible"
else
    echo "❌ Comando boost:mcp NO disponible"
    exit 1
fi

echo ""

# Mostrar herramientas disponibles
echo "🛠️  Comandos MCP disponibles:"
php artisan list | grep mcp

echo ""
echo "✨ Todo está configurado correctamente!"
echo ""
echo "📖 Para más información, lee: .github/MCP-SERVER.md"
echo ""
echo "🧪 Para probar el inspector MCP, ejecuta:"
echo "   php artisan mcp:inspector"

