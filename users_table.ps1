$groups = Get-LocalGroup
$output = @()
For($counter = 0; $counter -lt 6; $counter += 1)
{
    $row = new-object PSObject
    Foreach($group in $groups)
    {
        $member = Get-LocalGroupMember -Group $group
        if($member)
        {
        $row | Add-Member -MemberType NoteProperty $group -value $member[$counter]
        }   
    }
    $output += $row
}
$output |Format-Table 
