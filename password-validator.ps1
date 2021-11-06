$input = $args[0]
$file = $args[1]
$error_counter = 0

# Check for a -f flag
if ( $args[0] -eq "-f") {
    $input = Get-ChildItem $file -Recurse -Include *.txt | Get-Content
}
else {
    $input = $args[0]
}

# Check whether input conatins 10 characters or more.
if ($input.Length -lt 10) {
    $error_counter = 1
    Write-Host -ForegroundColor red "Password must be at least 10 characters" 
}

# Check whether input conatins upper case characters.
if ( ! ($input -cmatch "[A-Z]")) {
    $error_counter = 1
    Write-Host -ForegroundColor red "Password must contain upper case letters"
}

# Check whether input conatins lower case characters.
if ( ! ($input -cmatch "[a-z]")) { 
    $error_counter = 1
    Write-Host -ForegroundColor red "Password must contain lower case letters"
}

# Check whether input conatins numbers.
if ( ! ($input -cmatch "[0-9]")) { 
    $error_counter = 1
    Write-Host -ForegroundColor red "Password must contains numbers"
}

# If the error_counter is equal to 1, the password is invalid.
if ( $error_counter -eq 1) {
    Write-Host -ForegroundColor red "Password is not valid"
    exit 1;
}
else {
    Write-Host -ForegroundColor green "Password is valid"
    exit 0;
}
