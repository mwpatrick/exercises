function Get-LargestDifference
{
  param ($intsArray)
  $largest = 0

  # The idea here is to compare each number to every other number
  for (($x = 0); $x -lt ($intsArray.Count-1); $x++)
  {
      for (($i = $x + 1); $i -lt $intsArray.Count; $i++)
      {
        # to account for negative ints in the array, figure out
        # which number is the larger and then subtract the smaller
        # And casting to int is important otherwise you end up at 2:30am
        # questioning your very sanity when -7 is coming up greater than 1
        [int]$a = $intsArray[$x]; [int]$b = $intsArray[$i]
        if ($a -gt $b) { $large = $a; $small = $b } else { $large = $b; $small = $a }
        $difference = $large - $small
        if ($difference -gt $largest) { $largest = $difference }
      }
  }

  return $largest
}

Get-LargestDifference -intsArray 2,2,1,3            # 2
Get-LargestDifference -intsArray 0                  # 0
Get-LargestDifference -intsArray 4,3,5,7,1,7,7,6    # 6
Get-LargestDifference -intsArray 4,3,5,-7,1,7,7,6   # 14
