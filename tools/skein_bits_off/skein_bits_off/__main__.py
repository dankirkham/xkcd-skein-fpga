import argparse
from skein_bits_off.skein_bits_off import find_bits_off, find_hash


def main():
    parser = argparse.ArgumentParser(
        description="""
        Provided a Nonce and a CoreId, this will calculate the bits off of the
        XKCD Skein1024-1024 target.
        """
    )

    parser.add_argument('-n', dest='nonce', type=int,
                        default=0x41414141414141414141414141414141,
                        help='nonce value to hash')

    parser.add_argument('-c', dest='core_id', type=int,
                        default=0x424242,
                        help='core id to hash')

    parser.add_argument('-i', dest='increment', type=int,
                        default=0,
                        help='value to add to the nonce value')

    args = parser.parse_args()

    hash = find_hash(args.nonce + args.increment, args.core_id)

    bits_off = find_bits_off(hash)

    print("{} ({})".format(bits_off, hex(bits_off)))


if __name__ == "__main__":
    main()
