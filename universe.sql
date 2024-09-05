--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying NOT NULL,
    location_in_celestial_sphere character varying(3)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying,
    million_light_years_from_earth numeric(4,2),
    galaxy_type text,
    constellation_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    diameter_km integer,
    is_tidally_locked boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    has_life boolean,
    surface_temp_celcius integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    num_planets_in_orbit integer,
    signs_of_dying boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda Constellation', 'NQ1');
INSERT INTO public.constellation VALUES (3, 'Centaurus Constellation', 'SQ3');
INSERT INTO public.constellation VALUES (4, 'Canis Major', 'SQ1');
INSERT INTO public.constellation VALUES (5, 'Triangulum Constellation', 'NQ1');
INSERT INTO public.constellation VALUES (6, 'Dorado Constellation', 'SQ1');
INSERT INTO public.constellation VALUES (7, 'Coma Berenices', 'SQ4');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 2.54, 'Spiral', 1);
INSERT INTO public.galaxy VALUES (2, 'Milky Way Galaxy', 0.02, 'Spiral', 3);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Dwarf Galaxy', 0.02, 'dwarf irregular', 4);
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 3.00, 'Spiral', 5);
INSERT INTO public.galaxy VALUES (5, 'Cyrannus Galaxy', 0.16, 'irregular', 6);
INSERT INTO public.galaxy VALUES (6, 'Galactic Galaxy', 70.00, 'Spiral', 7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Pandora', 31, 11447, true);
INSERT INTO public.moon VALUES (2, 'Herse', 22, 4500, true);
INSERT INTO public.moon VALUES (3, 'Pandrosses', 22, 2500, true);
INSERT INTO public.moon VALUES (5, 'Minos', 15, 20347, true);
INSERT INTO public.moon VALUES (6, 'Nike', 16, 16898, true);
INSERT INTO public.moon VALUES (7, 'Hebe', 16, 14699, true);
INSERT INTO public.moon VALUES (8, 'Hibernia', 19, 17654, true);
INSERT INTO public.moon VALUES (9, 'Iris', 33, 4359, true);
INSERT INTO public.moon VALUES (10, 'Euboca', 33, 3564, false);
INSERT INTO public.moon VALUES (11, 'Persephone', 16, 1100, false);
INSERT INTO public.moon VALUES (12, 'Acermos I', 1, 5600, true);
INSERT INTO public.moon VALUES (13, 'Acermos II', 1, 3200, true);
INSERT INTO public.moon VALUES (15, 'Acermos III', 1, 2000, true);
INSERT INTO public.moon VALUES (16, 'Oberon', 9, 5680, true);
INSERT INTO public.moon VALUES (17, 'Umbriel', 9, 3423, true);
INSERT INTO public.moon VALUES (19, 'H-205A', 5, 2356, false);
INSERT INTO public.moon VALUES (20, 'H-444A', 6, 8755, false);
INSERT INTO public.moon VALUES (21, 'Zephyra', 7, 14993, true);
INSERT INTO public.moon VALUES (22, 'Crystallia', 29, 6845, true);
INSERT INTO public.moon VALUES (18, 'Aurorix', 8, 5461, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Acermos', 1, true, -85);
INSERT INTO public.planet VALUES (2, 'Proxima Centauri B', 2, false, -39);
INSERT INTO public.planet VALUES (3, 'Proxima Centauri d', 2, false, 87);
INSERT INTO public.planet VALUES (4, 'Proxima Centauri c', 2, false, -234);
INSERT INTO public.planet VALUES (5, 'H-205', 1, false, -177);
INSERT INTO public.planet VALUES (6, 'H-444', 1, false, 122);
INSERT INTO public.planet VALUES (7, 'Mornax Vinkaar', 1, false, NULL);
INSERT INTO public.planet VALUES (8, 'Sedele', 1, true, 14);
INSERT INTO public.planet VALUES (9, 'Ilus', 3, true, 16);
INSERT INTO public.planet VALUES (10, 'Icarus', 4, false, 550);
INSERT INTO public.planet VALUES (11, 'Picon', 4, true, 13);
INSERT INTO public.planet VALUES (13, 'Caprica', 4, true, 18);
INSERT INTO public.planet VALUES (14, 'Gemenon', 4, true, 5);
INSERT INTO public.planet VALUES (15, 'Tauron', 4, true, 20);
INSERT INTO public.planet VALUES (16, 'Zeus', 4, false, NULL);
INSERT INTO public.planet VALUES (18, 'Leonis', 5, true, 17);
INSERT INTO public.planet VALUES (17, 'Pallas', 5, false, -80);
INSERT INTO public.planet VALUES (19, 'Virgon', 5, true, 21);
INSERT INTO public.planet VALUES (20, 'Thanatos', 6, false, 21);
INSERT INTO public.planet VALUES (21, 'Ophion', 6, false, -257);
INSERT INTO public.planet VALUES (22, 'Libran', 6, true, 15);
INSERT INTO public.planet VALUES (23, 'Scorpia', 6, true, 23);
INSERT INTO public.planet VALUES (24, 'Sagittaron', 6, true, 20);
INSERT INTO public.planet VALUES (25, 'Phoebe', 7, false, 208);
INSERT INTO public.planet VALUES (26, 'Aerilon', 7, true, 17);
INSERT INTO public.planet VALUES (27, 'Canceron', 7, true, 23);
INSERT INTO public.planet VALUES (28, 'Hestia', 7, false, NULL);
INSERT INTO public.planet VALUES (29, 'Aquaria', 7, true, 0);
INSERT INTO public.planet VALUES (30, 'Styx', 7, false, NULL);
INSERT INTO public.planet VALUES (31, 'Polyphemus', 8, false, NULL);
INSERT INTO public.planet VALUES (33, 'Hera', 5, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Anasa', 1, 5, false);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 3, false);
INSERT INTO public.star VALUES (3, 'Goldilocks', 2, 2, true);
INSERT INTO public.star VALUES (6, 'Helios Gamma', 5, 5, false);
INSERT INTO public.star VALUES (7, 'Helios Delta', 5, 7, false);
INSERT INTO public.star VALUES (4, 'Helios Alpha', 5, 6, false);
INSERT INTO public.star VALUES (5, 'Helios Beta', 5, 3, false);
INSERT INTO public.star VALUES (8, 'Alpha Centauri', 2, 1, false);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 33, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

