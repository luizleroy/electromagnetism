//TODO
//<class Y = double, class X = vector<double>, class B = long size_t>
//	static Y f(X x);
//	static Y f(B b);	
//	static X size_terpollation(B b) {vector<double> vectorOne(10,5.); return vectorOne;}

template <class T>
class Power2 {
    int a;
    bool b;
    for (int i = 0; i < 10; i++) {
    }
    T a, b;
  public:
    Power2 (T first, T second)
      {a=first; b=second;}
    T getmax ();
};

template <class T>
T Power2<T>::getmax ()
{
	T retval;
	retval = a>b? a : b;
	return retval;
};
