v = 4:3:34              %4부터 34까지 3의 스텝으로 출력
u = v([3,5,7:10])       %3, 5, 7, 8, 9, 10번째 원소 출력. 배열이라고 대괄호를 밖으로 빼면 소괄호 안쪽이 다차원 행렬이 되면서 ㅈ댐.
 
A = [10:-1:4 ; ones(1,7) ; 2:2:14 ; zeros(1,7)]
B = A([1,3], [1,3,5:7])     % A행렬에서 첫번째 세번째 행, 그리고 1,3,5,6,7번째에 해당하는 열의 교차 원소들을 출력
