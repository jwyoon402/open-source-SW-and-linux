BEGIN {
	printf "%-8x %-10s %6s %6s %6s %6s %6s\n", "학번", "이름", "국어", "영어", "수학", "총점", "평균"
}

NR == 1{
	next
}

{
	total = $3 + $4 + $5
	avg = total / 3

	kor += $3
	eng += $4
	math += $5
	count++

	printf "%-8s %-10s %6d %6d %6d %6d %6.1f\n", $1, $2, $3, $4, $5, total, avg
}

END {
	if (count > 0){
		printf "%-8s %-10s %6.1f %6.1f %6.1f\n", "", "과목평균", kor/count, eng/count, math/count
	}
}
