#!/bin/bash

# Project name
PROJECT_NAME="AppBrewery-FS"

# Number of sections
NUM_SECTIONS=44

# Create the project directory
#mkdir "$PROJECT_NAME" || { echo "Directory '$PROJECT_NAME' already exists!"; exit 1; }
#cd "$PROJECT_NAME"

# Create the sections directory
mkdir sections

# Loop through the sections and create their subdirectories and files
for i in $(seq 1 "$NUM_SECTIONS"); do
  SECTION_NAME="Section $i"  # More descriptive section name
  SECTION_DIR="sections/$SECTION_NAME"
  mkdir -p "$SECTION_DIR"/{assets}

  touch "$SECTION_DIR/index.html" "$SECTION_DIR/styles.css" "$SECTION_DIR/script.js"

  # Add basic HTML to index.html (with section name)
  echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title>$SECTION_NAME</title>
    <link rel=\"stylesheet\" href=\"styles.css\">
</head>
<body>
    <h1>$SECTION_NAME</h1>
    <script src=\"script.js\"></script>
</body>
</html>" > "$SECTION_DIR/index.html"

done

# Create top-level files and directories
touch index.html styles.css script.js
mkdir assets

# Create .gitignore and README.md (same as before)
# ... (no changes here)

# Create index.html with navigation (updated for numbered sections)
cat << EOF > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$PROJECT_NAME</title>
    <style>
        /* ... (same CSS as before) */
    </style>
</head>
<body>
    <h1>Welcome to $PROJECT_NAME</h1>

    <nav>
        <ul>
$(for i in $(seq 1 "$NUM_SECTIONS"); do
    SECTION_NAME="Section $i"
    echo "            <li><a href=\"sections/$SECTION_NAME/index.html\">$SECTION_NAME</a></li>"
done)
        </ul>
    </nav>

    <p>This is the main page of your project. Use the links above to navigate to the different sections.</p>

</body>
</html>
EOF

echo "Project '$PROJECT_NAME' scaffolded successfully!"
