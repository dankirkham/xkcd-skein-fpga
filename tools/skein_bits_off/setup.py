from setuptools import setup, find_packages


setup(
    name="skein_bits_off",
    version="0.1",

    description="""
    Provided a Nonce and a CoreId, this will calculate the bits off of the
    XKCD Skein1024-1024 target.
    """,

    packages=find_packages(),

    install_requires=['pyskein'],

    entry_points={
        'console_scripts': [
            'skein_bits_off=skein_bits_off.__main__:main',
        ],
    },
)
