First, create a few directories at `/` before install (this bash script is untested):

```bash
setup_root_mount() {
  path=$1
  name=$2
  disk=$3
  echo $path | sudo tee -a /etc/synthetic.conf
  /System/Library/Filesystems/apfs.fs/Contents/Resources/apfs.util -B
  echo "LABEL=$name /$path apfs rw" | sudo tee -a /etc/fstab
  sudo diskutil apfs addVolume $disk APFSX $name -mountpoint /$path
  sudo diskutil enableOwnership /$path
  sudo chown -R $(whoami) /$path
  passphrase=$(ruby -rsecurerandom -e 'puts SecureRandom.hex(32)')
  uuid="$(diskutil info /nix | awk '$2 == "UUID:" { print $3 }')"
  echo $passphrase | sudo diskutil apfs enableFileVault /$path -user disk -stdinpassphrase
  security add-generic-password \
    -l $name \
    -a $uuid \
    -s $uuid \
    -D "Encrypted Volume Password" \
    -w $passphrase \
    -T "/System/Library/CoreServices/APFSUserAgent" \
    -T "/System/Library/CoreServices/CSUserAgent"
}
setup_root_mount nix Nix
setup_root_mount run Run
```

From https://github.com/burke/b/blob/master/README.md
