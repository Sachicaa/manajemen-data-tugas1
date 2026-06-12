#!/bin/bash
USER_FILE="daftar_user.txt"
if [ ! -f "$USER_FILE" ]; then
    echo "File $USER_FILE tidak ditemukan!"
    exit 1
fi
echo "===== MEMBUAT USER BARU ====="
while IFS= read -r username; do
    [ -z "$username" ] && continue
    if id "$username" &>/dev/null; then
        echo "User $username sudah ada, dilewati."
    else
        sudo useradd -m -s /bin/bash "$username"
        echo "$username:${username}@123" | sudo chpasswd
        echo "User $username dibuat (password: ${username}@123)"
    fi
done < "$USER_FILE"
echo "===== SELESAI ====="
