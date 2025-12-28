#!/bin/bash

# Скрипт для безопасного удаления дублирующихся файлов
# Оставляет версии в папке App/, удаляет из корневых папок

echo "=== Удаление дублирующихся файлов ==="
echo ""
echo "⚠️  ВНИМАНИЕ: Этот скрипт удалит дубликаты из корневых папок"
echo "              Будут сохранены версии в папке App/"
echo ""
echo "Папки для удаления:"
echo "  - /Modules (дубликат App/Features)"
echo "  - /Models (дубликат App/Models)"  
echo "  - /Navigation (дубликат App/Navigation)"
echo "  - /Services (дубликат App/Services)"
echo "  - /Shared (дубликат App/Shared)"
echo "  - /Utils (дубликат App/Utils)"
echo "  - /Shop.kg (дубликат App/Shop.kg)"
echo "  - Корневые файлы (AppCoordinator, AppDelegate, AppRouter, Info.swift)"
echo ""
read -p "Продолжить? (y/n) " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Отменено"
    exit 1
fi

echo ""
echo "🔄 Начинаем удаление..."
echo ""

# Удаляем дублирующиеся папки (НЕ в App)
FOLDERS_TO_REMOVE=(
    "./Modules"
    "./Models"
    "./Navigation"
    "./Services"
    "./Shared"
    "./Utils"
    "./Shop.kg"
)

for folder in "${FOLDERS_TO_REMOVE[@]}"; do
    if [ -d "$folder" ]; then
        echo "🗑️  Удаляем: $folder"
        rm -rf "$folder"
    fi
done

# Удаляем дублирующиеся корневые файлы
ROOT_FILES=(
    "./AppCoordinator.swift"
    "./AppDelegate.swift"
    "./AppRouter.swift"
    "./Info.swift"
)

for file in "${ROOT_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "🗑️  Удаляем: $file"
        rm -f "$file"
    fi
done

echo ""
echo "✅ Готово! Дубликаты удалены."
echo ""
echo "📝 Следующие шаги:"
echo "   1. Откройте проект в Xcode"
echo "   2. Удалите ссылки на удалённые папки из Project Navigator"
echo "   3. Убедитесь, что все файлы находятся в папке App/"
echo "   4. Сделайте Clean Build (Cmd+Shift+K)"
echo "   5. Запустите сборку (Cmd+B)"
echo ""
