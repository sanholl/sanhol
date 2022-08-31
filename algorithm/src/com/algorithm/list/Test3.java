package com.algorithm.list;

import java.util.LinkedList;
import java.util.List;

public class Test3 {
	//자연수 n을 뒤집어 각 자리 숫자를 원소로 가지는 배열 형태로 리턴해주세요. 예를들어 n이 12345이면 [5,4,3,2,1]을 리턴합니다.
	
	public static void main(String[] args) {
		
	}
	
	class Solution {
	    public int[] solution(long n) {
	    	List<Integer> list = new LinkedList<>();
	    	
	    	while(n > 0) {
	    		list.add((int)(n % 10));
	    		n /= 10;
	    	}
	    	
	        int[] answer = new int[list.size()];
	        for(int i = 0; i < list.size(); i++) {
	        	answer[i] = list.get(i);
	        }
	        
	        return answer;
	    }
	}
}
