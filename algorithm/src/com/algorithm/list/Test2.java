package com.algorithm.list;

import java.util.Arrays;

public class Test2 {
	public static void main(String[] args) {
		/*문제 설명
		길이가 n인 배열에 1부터 n까지 숫자가 중복 없이 한 번씩 들어 있는지를 확인하려고 합니다.
		1부터 n까지 숫자가 중복 없이 한 번씩 들어 있는 경우 true를, 아닌 경우 false를 반환하도록 함수 solution을 완성해주세요.

		제한사항
		배열의 길이는 10만 이하입니다.
		배열의 원소는 0 이상 10만 이하인 정수입니다.*/
		Solution A = new Solution();
		int[] arr = {4,1,2};
		
		System.out.println(A.solution(arr));
	}
}

class Solution {
    public boolean solution(int[] arr) {
        
//    	// O(n^2)
//        for(int i = 1; i < arr.length; i++) {
//        	
//        	int found = 0;
//        	for(int a : arr) {
//        		if(a == i) found++;
//        	}
//        	
//        	if(found != 1) return false;
//        }
    	
    	// O(nlogn)
    	int[] answer = new int[arr.length];
    	for(int i = 0; i < arr.length; i++) answer[i] = i+1; // O(n)
    	
    	Arrays.sort(arr); // O(nlogn)
        
        return Arrays.equals(answer, arr); // O(n)
    }
}
