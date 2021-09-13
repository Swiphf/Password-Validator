param (
    [switch]$f
)

Function validate ([string]$text) {    
    if ($f) {
        # read from file
        $text = Get-Content ./text.txt        
    }

    if (checkLength $text) {        
        if (containsNumbers $text) {
            if (containsLowercase $text) {
                if (containsUppercase $text) {
                    if (containSpecialChars $text) {
                        Write-Host "Valid" -ForegroundColor Green
                    }
                    else {
                        Write-Host "Password must contain special characters" -ForegroundColor Red
                        return 1    
                    }
                }
                else {
                    Write-Host "Password must contain upper case letters" -ForegroundColor Red
                    return 1    
                }
            }
            else {
                Write-Host "Password must contain lower case letters" -ForegroundColor Red
                return 1    
            }                       
        }   
        else {
            Write-Host "Password must contain numbers" -ForegroundColor Red
            return 1    
        }     
    }
    else {                
        Write-Host "Password must contain at least 10 characters" -ForegroundColor Red
        return 1
    }     
} 


Function checkLength($arg) {        
    return ($arg.length -gt 10)
}

Function containsNumbers($arg) {    
    return ($arg -match '\d')
}

Function containsLowercase($arg) {    
    return ($arg -cmatch "[a-z]")
}

Function containsUppercase($arg) {             
    return ($arg -cmatch "[A-Z]")
}

Function containSpecialChars($arg) {                 
    return ($arg -cmatch "[!@#$%^&*()_+|]")   
}

validate $args