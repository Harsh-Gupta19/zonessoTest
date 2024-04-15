--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: showrooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.showrooms (
    id integer NOT NULL,
    name character varying(255),
    distance numeric(10,2),
    distance_unit character varying(10),
    opening_hours character varying(255),
    manager_name character varying(255)
);


ALTER TABLE public.showrooms OWNER TO postgres;

--
-- Name: showrooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.showrooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.showrooms_id_seq OWNER TO postgres;

--
-- Name: showrooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.showrooms_id_seq OWNED BY public.showrooms.id;


--
-- Name: vehicles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicles (
    id integer NOT NULL,
    vehicle_type character varying(255),
    name character varying(255),
    type character varying(255)[],
    category character varying(255),
    model_year character varying(4),
    price numeric(10,2),
    currency character varying(3),
    location character varying(255),
    posted_date date,
    posted_by character varying(255),
    "trim" character varying(255),
    region_specs character varying(255),
    doors integer,
    body_type character varying(255),
    fuel_type character varying(255),
    seller_type character varying(255),
    transmission_type character varying(255),
    horsepower character varying(255),
    cylinders_no integer,
    warranty boolean,
    exterior_color character varying(255),
    interior_color character varying(255),
    market character varying(255),
    showroom_id integer
);


ALTER TABLE public.vehicles OWNER TO postgres;

--
-- Name: vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicles_id_seq OWNER TO postgres;

--
-- Name: vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicles_id_seq OWNED BY public.vehicles.id;


--
-- Name: showrooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.showrooms ALTER COLUMN id SET DEFAULT nextval('public.showrooms_id_seq'::regclass);


--
-- Name: vehicles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles ALTER COLUMN id SET DEFAULT nextval('public.vehicles_id_seq'::regclass);


--
-- Name: showrooms showrooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.showrooms
    ADD CONSTRAINT showrooms_pkey PRIMARY KEY (id);


--
-- Name: vehicles vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);


--
-- Name: vehicles fk_showroom_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT fk_showroom_id FOREIGN KEY (showroom_id) REFERENCES public.showrooms(id);


--
-- PostgreSQL database dump complete
--

