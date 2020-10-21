
function [u_l,u_h,a1,a2] = new_try_p(v_l,v_h,umin,umax)
  
% DIR_ALLOC - Direct control allocation.
%
%  [u,a] = dir_alloc(B,v,umin,umax)
%
% Performs direct control allocation by solving the LP
%
%   max a   subj. to  Bu = av
%   a,u               umin <= u <= umax
%
% If a > 1, set u = u/a.
%
% Note: This function has not been optimized for speed.
%
%  Inputs:
%  -------
% B     control effectiveness matrix (k x m)
% v     commanded virtual control (k x 1)
% umin  lower position limits (m x 1)
% umax  upper position limits (m x 1)
% 
%  Outputs:
%  -------
% u     optimal control
% a     scaling factor
%
% See also: DIR_SIM.
  B=[-0.5   0       0.5   0;
     0  -0.5    0       0.5;
    0.25   0.25   0.25   0.25]; 
[k,m] = size(B);
BB=[B zeros(k,m);zeros(k,m) B];
% Number of variables
  
  
  % Reformulate problem to fit linprog format:
  %
  % min f'x subj. to A*x <=b
  %                  Aeq*b = beq
  %		     lb <= x <= ub
  
  % x = [a ; u]
  % f' = [-1 0 ... 0] (min -a <-> max a)
  f = [-1 -1 zeros(1,m) zeros(1,m)]';
  % A, b empty
  AA = eye(10);
  AA(7:10,3:6)=eye(4);
  A=[AA;-AA];
  b = [1e4;1e4;umax;umax;0;0;-umin;-umin];
  % Bu = av <=> [-v B]x = 0
 v=[v_l zeros(3,1);zeros(3,1) v_h];
  Aeq = [-v BB];
  beq = zeros(6,1);
  % a >= 0, umin <= u <= umax
  lb = [0 umin' umin']';
  ub = [1e4 umax' umax']'; % 1e4 should be infty but error if too large.
  
  % Solve linear program
  options = optimset('Display', 'off');
  x = linprog(f,A,b,Aeq,beq,[],[],[],options);
%================================================
%  minimizes 1/2*x'*H*x + f'*x
% A*x ¡Ü b
%  Aeq*x = beq
% lb ¡Ü x ¡Ü ub
% H=zeros(10,10);
% H(1,1)=1;
% H(2,2)=1;
% f=zeros(1,10);
% x = quadprog(-H,f,A,b,Aeq,beq,[],[]) ;
%================================================
  a1 = x(1);
 a2 = x(2);
  u_l =x(3:6);
  u_h = x(7:end);
  
  % Scale down u if a>1
  if a1>1
   u_l = u_l/a1;
  end
  if a2>1
    u_h = u_h/a2;
  end