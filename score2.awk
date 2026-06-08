NR == 1 {
	nsubj = NF - 2

	printf "%-8s %-10s", $1, $2

	for (i = 3; i <= NF; i++) {
		subject[i-2] = $1
		printf "%6s", $i
	}

	printf "%6s %6s\n", "총점", "평균"
	next
}

{
	total = 0

	printf "%-8s %-10s", $1, $2

	for (i = 3; i <=NF; i++) {
		total += $i
		sum[i-2] += $i
		printf "%6d", $i
	}

	count++
	avg = total / nsubj

	printf "%6d %6.1f\n", total, avg
}

END {
	if (count > 0) {
		printf "%-8s %-10s", "", "과목평균"

		for (i = 1; i <= nsubj; i++) {
			printf "%6.1f", sum[i] / count
		}

		printf "\n"
	}
}
