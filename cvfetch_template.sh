#!/usr/bin/env bash
# cvfetch — fastfetch-style CV display (empty template)

c1="\e[1;36m"   # cyan bold (labels)
c2="\e[1;37m"   # white bold (values)
acc="\e[1;35m"  # magenta (accent)
rst="\e[0m"

LOGO_PATH="$HOME/Pictures/logo.png"

# --- OS info (pulled live from the system) ---
if [ -f /etc/os-release ]; then
    OS_NAME=$(. /etc/os-release && echo "$PRETTY_NAME")
else
    OS_NAME=$(uname -srm)
fi

info=(
"${c1}handle${rst}@${c1}cv${rst}"
"-------------------"
"${c1}Name${rst}:       ${c2}${rst}"
"${c1}Handle${rst}:     ${c2}${rst}"
"${c1}Origin${rst}:     ${c2}${rst}"
"${c1}Role${rst}:       ${c2}${rst}"
"${c1}Founder${rst}:    ${c2}${rst}"
"${c1}Fandom${rst}:     ${c2}${rst}"
"${c1}Projects${rst}:   ${c2}${rst}"
"${c1}Games${rst}:      ${c2}${rst}"
"${c1}OS${rst}:         ${c2}${OS_NAME}${rst}"
"${c1}Interests${rst}:  ${c2}${rst}"
"-------------------"
"${acc}[contacts]${rst}"
"${c1}Discord${rst}:    ${c2}${rst}"
"${c1}YouTube${rst}:    ${c2}${rst}"
"${c1}Email${rst}:      ${c2}${rst}"
)

# --- Logo: use chafa to render the image if available, else fallback ASCII ---
if command -v chafa >/dev/null 2>&1 && [ -f "$LOGO_PATH" ]; then
    logo_raw=$(chafa --size=18x18 --format=symbols "$LOGO_PATH" 2>/dev/null)
    IFS=$'\n' read -rd '' -a logo <<< "$logo_raw"
else
    logo=(
    "     ___       "
    "    /   \\      "
    "   |     |     "
    "    \\___/      "
    "   /|   |\\     "
    "  / |___| \\    "
    )
    [ ! -f "$LOGO_PATH" ] && echo -e "${acc}[note]${rst} logo not found at $LOGO_PATH — using fallback ASCII" >&2
    command -v chafa >/dev/null 2>&1 || echo -e "${acc}[note]${rst} 'chafa' not installed — install it to render a logo image" >&2
fi

max=${#logo[@]}
[ ${#info[@]} -gt $max ] && max=${#info[@]}

for ((i=0; i<max; i++)); do
    l="${logo[$i]:-                  }"
    r="${info[$i]}"
    printf "%-20s  %b\n" "$l" "$r"
done
