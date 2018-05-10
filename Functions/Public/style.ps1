Function style {
    <#
    .SYNOPSIS
    Create a style title in an HTML document.
    
    .EXAMPLE

    style 
    .EXAMPLE
    style "woop1" -Class "class"

    .EXAMPLE
    $css = @"
        "p {color:green;} 
        h1 {color:orange;}"
    "@
    style {$css} -media "print" -type "text/css"

    .Notes
    Author: Stéphane van Gulick
    Version: 1.0.0
    History:
        2018.05.09;@Stephanevg; Creation

    #>
    [Cmdletbinding()]
    Param(
        [Parameter(Mandatory=$false)]
        [AllowEmptyString()]
        [AllowNull()]
        $Content,

        [String]$media,

        [String]$Type,

        [AllowEmptyString()]
        [AllowNull()]
        [String]$Class,

        [String]$Id,
        
        [Hashtable]$Attributes
    )

    $attr = ""
        $CommonParameters = "tagname" + [System.Management.Automation.PSCmdlet]::CommonParameters + [System.Management.Automation.PSCmdlet]::OptionalCommonParameters
        $CustomParameters = $PSBoundParameters.Keys | ? { $_ -notin $CommonParameters }
        
        


        $htmltagparams = @{}
        $tagname = "style"
        if($CustomParameters){
            
            foreach ($entry in $CustomParameters){

                if($entry -eq "content"){

                    
                    $htmltagparams.$entry = $PSBoundParameters[$entry]
                }else{
                    $htmltagparams.$entry = "{0}" -f $PSBoundParameters[$entry]
                }
                
    
            }

            Set-HtmlTag -TagName $tagname -Attributes $htmltagparams   
        }

    

}



$css = @"
    "p {color:green;} 
    h1 {color:orange;}"
"@
style {P{"woop"}} -media "print" -type "text/css"