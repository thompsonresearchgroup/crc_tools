#! /bin/awk -f

/ Step number/{
	print;
}
/WARNING! : large/{
	line=$0;
	getline;
	line=line $0 ;
	print line;
} 
/ITN/{
	print;
}
/ONIOM: Microiterations cycle/{
	print;
}
