# Cvfetch

A fastfetch-style terminal script that displays a personal CV instead of system info — name, role, projects, and contact links, with a customizable ASCII/image logo.

## Download

git clone https://github.com/Rexrad/Cvfetch.git
cd Cvfetch
chmod +x cvfetch-template.sh

## Run

./cvfetch-template.sh

Run from anywhere (optional):

**bash / zsh:**
mv cvfetch-template.sh ~/.local/bin/cvfetch
export PATH="$HOME/.local/bin:$PATH"   # add to ~/.bashrc or ~/.zshrc if missing

**fish:**
mv cvfetch-template.sh ~/.local/bin/cvfetch
fish_add_path ~/.local/bin

Then run `cvfetch` from anywhere.

## Edit with your own info

nano cvfetch-template.sh

Edit the values inside the `info=(...)` block — each line looks like:
"${c1}Name${rst}:  ${c2}your name here${rst}"

Just change the text between `${c2}` and `${rst}`.

- **OS** is pulled automatically — no need to edit it.
- **Logo**: place your image at `~/Pictures/logo.png`, and install `chafa`:
  sudo pacman -S chafa      # Arch
  sudo apt install chafa    # Debian/Ubuntu
  If missing, a default ASCII shape is used.

Save in nano: `Ctrl+O` then `Enter`. Exit: `Ctrl+X`.

## Push changes back (if it's your repo)

git add cvfetch-template.sh
git commit -m "Update my info"
git push
