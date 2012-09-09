#!/usr/bin/env bash
#
# Dotfiles installer
# 2012 Taras Yagniuk <mrtaryk@gmail.com>
#

ITEMS=(
bin
.zshrc
.zsh
.emacs
.emacs.d
.emacs-private
.xbindkeysrc
.xxkbrc
.Xdefaults
.perltidyrc
.config/awesome
)

BACKUPDIR="${HOME}/backups/backup-$(date +'%Y%m%d%H%M%S')"
MOVED=0

function mkbackupdir {
  if [ ! -d "${BACKUPDIR}" ]; then
      mkdir -p "${BACKUPDIR}"
      # echo "backup dir: ${BACKUPDIR}"
  fi
}

function submodules-update {
    echo "Updating submodules.."
    git submodule update --init
    echo "done"
}

echo "Dotfiles Installer
------------------"

submodules-update

LASTINDEX=$((${#ITEMS[*]}-1))

for INDEX in $(seq 0 $LASTINDEX); do
    FILE=${ITEMS[$INDEX]}
    DOTFILE=~/${FILE}
    echo -n "[$((${INDEX}+1))/${#ITEMS[*]}]: install '${DOTFILE}' [y/n] ? "
    read YN
    if [ "$YN" == "y" ]; then
      if [ -L $DOTFILE ]; then
          rm "$DOTFILE"
          echo "old symlink '${DOTFILE}' has been removed"
      else
          if [ $MOVED -eq 0 ]; then
              mkbackupdir
          fi
          let "MOVED++"
          mv "${DOTFILE}" "${BACKUPDIR}/${FILE}"
          echo "old file '${DOTFILE}' has been moved to '${BACKUPDIR}/${FILE}'"
      fi
      ln -s "${PWD}/${FILE}" "${DOTFILE}"
      echo "done"
    fi
done

echo "------------------------
Finished successfully"

exit 0
