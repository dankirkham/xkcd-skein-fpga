#include <stdint.h>

class Threefish
{
 private:
  void Extend (const int count, uint64_t[]);
  void GenerateSubkeys (const uint64_t[],
			const uint64_t[],
			uint64_t[]);
  int RotationConstant (const int,
			const int);
  void Mix (const int,
	    const int,
	    const uint64_t&,
	    const uint64_t&,
	    uint64_t&,
	    uint64_t&);
  void Permute (const uint64_t[],
		uint64_t[]);
 public:
  Threefish ();
  void Encrypt (uint64_t[],
		uint64_t[],
		uint64_t[],
		uint64_t[]);
};
