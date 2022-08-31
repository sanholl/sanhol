package com.algorithm.list;

import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

class MyData{
	int value;
	
	public MyData(int value) {
		this.value = value;
	}
	
	static MyData create(int v) {
		return new MyData(v);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MyData other = (MyData) obj;
		return value == other.value;
	}

	@Override
	public String toString() {
		return ""+value;
	}
}

public class UseList {
	public static void main(String[] args) {
		List<Integer> list = new LinkedList<>();
		list.add(1);
		list.add(2);
		list.add(3);
		list.add(4);
		list.add(1,5);
		list.remove(1);
		
		System.out.println(list);
		System.out.println(list.contains(3));
		System.out.println(list.contains(Integer.valueOf(3)));
		
	
		List<MyData> list2 = new Vector<>();
		list2.add(MyData.create(1));
		list2.add(MyData.create(2));
		list2.add(MyData.create(3));
		
		System.out.println(list2);
		System.out.println(list2.contains(3));
		System.out.println(list2.contains(MyData.create(2)));
		System.out.println(list2.indexOf(MyData.create(2)));
		System.out.println(list2.size());
		System.out.println(list2.isEmpty());
		
		method1(list2);
	}
	
	static void method1(List<MyData> list){
		System.out.println(list.size());
		System.out.println(list.isEmpty());
	}
	
}


