#include "kvs.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define KEY_SIZE 16
#define VAL_SIZE 46

int put(char* key, char* value, int nbytes);
void load(char* filename);

int main(int argc, char* argv[]) {
	if(argc!=4){
		perror("Option Error");
		exit(1);
	}

	load(argv[1]);
}

void load(char* filename) {
	FILE* fp = fopen(filename, "r");
	if(fp != NULL) {
		while(1) {
			if(feof(fp)) break;
			else {
				char str[KEY_SIZE];
				char str2[VAL_SIZE];
				fscanf(fp, "%s %s\n", str, str2);
				int l=strlen(str2);
				char* strd = (char*)malloc(sizeof(char)*(l+1));
				strcpy(strd,str2);
				printf("%s %s %d\n", str, strd, l);
			}
		}
	}
	fclose(fp);
}

