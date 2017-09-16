package main;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

public class Owlandfox {
	
	public static int rearrange(int num) {
		if (num % 10 == 0) {
			if (num % 100 == 0) {
				if (num % 1000 == 0) {
					if (num % 10000 == 0) {
						if (num % 100000 == 0) {
							return num - 100000;
						}
						return num - 10000;
					}
					return num - 1000;
				}
				return num - 100;
			}
			return num - 10;
		}
		return num - 1;
	}

	public static void main(String[] args) throws IOException {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		int cases = Integer.parseInt(reader.readLine());
		for (int i = 0; i < cases; i++) {
			System.out.println(rearrange(Integer.parseInt(reader.readLine())));
		}
		
		reader.close();
	}

}
