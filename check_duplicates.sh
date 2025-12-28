#!/bin/bash

echo "=== Поиск дублирующихся Swift файлов ==="
echo ""

# Находим все дублирующиеся имена файлов
DUPLICATES=$(find . -name "*.swift" -type f -exec basename {} \; | sort | uniq -d)

if [ -z "$DUPLICATES" ]; then
    echo "✅ Дубликатов не найдено!"
    exit 0
fi

echo "❌ Найдены дублирующиеся файлы:"
echo ""

# Для каждого дубликата показываем все его расположения
for file in $DUPLICATES; do
    echo "📄 $file:"
    find . -name "$file" -type f | sed 's/^/   /'
    echo ""
done

echo "=== Статистика ==="
TOTAL_DUPLICATES=$(echo "$DUPLICATES" | wc -l | tr -d ' ')
echo "Всего файлов с дубликатами: $TOTAL_DUPLICATES"
